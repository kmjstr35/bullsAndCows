// MAIN.sv

`timescale 1ns / 1ps

module main (
    numpad,
    segment_data,
    segment_posit,
    seven_segment,
    clk,
    sharp_rst,
    star_next,
    dipswitch_one,
    dipswitch_two,
    isSeedSettingFin,
    piezo,
    full_color_red_led,
    full_color_greed_led
);

input wire clk;
input wire [9:0] numpad;
input wire sharp_rst;
input wire star_next;
input wire dipswitch_one;
input wire dipswitch_two;

output reg [6:0] segment_data;
output reg [3:0] full_color_red_led;
output reg [3:0] full_color_greed_led;

output reg [6:0] seven_segment;
output reg [7:0] segment_posit;
output reg [3:0] isSeedSettingFin;
output reg piezo;

// Setting CLK = 1MHz (1,000,000Hz)
// 1sec = int sec;

parameter [6:0] DISPLAY [9:0] = {7'b1101111, 7'b1111111, 7'b0000111, 7'b1111101, 7'b1101101, 7'b1100110, 7'b1001111, 7'b1011011, 7'b0000110, 7'b0111111};

parameter [7:0] segment_posit_select [7:0] = {~8'd1, ~8'd2, ~8'd4, ~8'd8, ~8'd16, ~8'd32, ~8'd64, ~8'd128 };

// assign segment_posit = 1'b1;
////////////////

bit [2:0][3:0] inputs; // 4bit register * 3
bit [3:0] tmp_input; // 4bit register one
bit [2:0][3:0] gen; // 4bit register * 3

bit [3:0][3:0] seed_inputs; // 4bit register * 4
bit [15:0] state; // 16-bit state for the XORShift algorithm
// bit unique_bit;

bit [1:0] ball_count   ; // 2bit counter
bit [1:0] strike_count ; // 2bit counter

int finish, cnt, i_loop, sec, over_cnt_lose, success_cnt;
int cur_tone, cur_start, cur_last;
int seed_input_flag, success_flag;

int music_idx; // 0 -> normal, 1 -> gameover, 2 -> win

initial begin
  inputs       <= '{'{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0}};
  seed_inputs  <= '{'{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0}};
  tmp_input <= '{0,0,0,0};
  gen          <= '{'{0,1,0,0}, '{0,0,1,0}, '{0,0,0,1}};// 4 2 1\
  state <= 16'b0000000000000000;
  ball_count   <= '{0, 0};
  strike_count <= '{0, 0};
  finish <= 0;
  cnt <= 0;
  over_cnt_lose <= 0;
  
  segment_posit <= 8'b11111111;
  seven_segment <= DISPLAY[0];
  i_loop <= 0;
  sec <= 1000000;

  isSeedSettingFin <= 4'b0000;
  seed_input_flag <= 0;
  success_flag <= 0;
  music_idx <= 0;

  success_cnt <= 0;

  full_color_red_led <= 4'b1111;
  full_color_greed_led <= 4'b0000;

end

always @(posedge clk) begin
    if (isSeedSettingFin == 4'b1111) begin
        full_color_red_led <= 4'b0000;
    end

    else begin
        full_color_red_led <= 4'b1111;
    end

    if (dipswitch_one == 1'b0) begin
        if (sharp_rst == 1'b0) begin
            if (cnt < 10) begin
                segment_data <= DISPLAY[cnt];
                
                if (success_flag == 0) begin
                    if (finish == 0) begin
                        if (star_next == 1'b0 && numpad != 10'b0) begin // keypad input
                                tmp_input <= (numpad == 10'b0000000001) ? 4'b0000 : 
                                            (numpad == 10'b0000000010) ? 4'b0001 :
                                            (numpad == 10'b0000000100) ? 4'b0010 :
                                            (numpad == 10'b0000001000) ? 4'b0011 :
                                            (numpad == 10'b0000010000) ? 4'b0100 :
                                            (numpad == 10'b0000100000) ? 4'b0101 :
                                            (numpad == 10'b0001000000) ? 4'b0110 :
                                            (numpad == 10'b0010000000) ? 4'b0111 :
                                            (numpad == 10'b0100000000) ? 4'b1000 :
                                            (numpad == 10'b1000000000) ? 4'b1001 : 4'b0000;
                        end

                        
                        if (inputs[0] == 4'b0000) begin
                            seven_segment <= DISPLAY[tmp_input];
                            segment_posit <= segment_posit_select[7];
                        end
                        
                        else if (inputs[1] == 4'b0000) begin
                            if (i_loop == 0) begin
                                seven_segment <= DISPLAY[inputs[0]];
                                segment_posit <= segment_posit_select[7];
                                i_loop <= i_loop + 1;
                            end
                            
                            else begin // i_loop == 1
                                seven_segment <= DISPLAY[tmp_input];
                                segment_posit <= segment_posit_select[6];
                                i_loop <= 0;
                            end
                        end

                        else if (inputs[2] == 4'b0000) begin
                            if (i_loop == 0) begin
                                seven_segment <= DISPLAY[inputs[0]];
                                segment_posit <= segment_posit_select[7];
                                i_loop <= i_loop + 1;
                            end
                            
                            else if (i_loop == 1) begin // i_loop == 1
                                seven_segment <= DISPLAY[inputs[1]];
                                segment_posit <= segment_posit_select[6];
                                i_loop <= i_loop + 1;
                            end

                            else begin // i_loop == 2
                                seven_segment <= DISPLAY[tmp_input];
                                segment_posit <= segment_posit_select[5];
                                i_loop <= 0;
                            
                            end
                        end

                        if (star_next == 1'b1) begin // 숫자 안누르고 * 눌렀을떄
                            if (inputs[0] == 4'b0000) begin // inputs[0]이 비어있으면
                                inputs[0] <= tmp_input;
                            end
                            else if ((inputs[1] == 4'b0000) && (tmp_input != inputs[0])) begin
                                inputs[1] <= tmp_input;
                                
                            end
                            else if (inputs[2] == 4'b0000 && (tmp_input != inputs[0]) && (tmp_input != inputs[1])) begin
                                inputs[2] <= tmp_input;
                                
                            end

                            else if (inputs[0] != 4'b0000 && inputs[1] != 4'b0000 && inputs[2] != 4'b0000) begin // 다 채워졌을때 
                                strike_count <= ((inputs[0] == gen[0]) ? 2'b01 : 2'b00) +
                                        ((inputs[1] == gen[1]) ? 2'b01 : 2'b00) +
                                        ((inputs[2] == gen[2]) ? 2'b01 : 2'b00);

                                ball_count   <= ((inputs[0] == gen[1] || inputs[0] == gen[2]) ? 2'b01 : 2'b00) +
                                        ((inputs[1] == gen[0] || inputs[1] == gen[2]) ? 2'b01 : 2'b00) +
                                        ((inputs[2] == gen[0] || inputs[2] == gen[1]) ? 2'b01 : 2'b00);

                        
                                finish <= 1;
                                cnt <= cnt + 1;
                            end
                        end
                    end

                    else begin
                        if (finish < (5 * sec)) begin

                            if (finish % 7 == 1) begin
                                segment_posit <= segment_posit_select[7];
                                seven_segment <= DISPLAY[inputs[0]];
                                finish <= finish + 1;
                            end
                        
                            else if (finish % 7 == 2) begin
                                segment_posit <= segment_posit_select[6];
                                seven_segment <= DISPLAY[inputs[1]];
                                finish <= finish + 1;
                            end

                            else if (finish % 7 == 3) begin
                                segment_posit <= segment_posit_select[5];
                                seven_segment <= DISPLAY[inputs[2]];
                                finish <= finish + 1;
                            end


                            else if (finish % 7 == 4) begin
                            segment_posit <= segment_posit_select[3];
                            seven_segment <=    (strike_count == 2'b01) ? DISPLAY[1] : 
                                                (strike_count == 2'b10) ? DISPLAY[2] :
                                                (strike_count == 2'b11) ? DISPLAY[3] : DISPLAY[0];
                            finish <= finish + 1;
                            end

                            else if (finish % 7 == 5) begin
                                segment_posit <= segment_posit_select[2];
                                seven_segment <= 7'b1101101; // 'S'에 해당하는 7-segment 값
                                finish <= finish + 1;
                            end

                            else if (finish % 7 == 6) begin
                                segment_posit <= segment_posit_select[1];
                                seven_segment <=    (ball_count == 2'b01) ? DISPLAY[1] : 
                                                    (ball_count == 2'b10) ? DISPLAY[2] :
                                                    (ball_count == 2'b11) ? DISPLAY[3] : DISPLAY[0];
                                finish <= finish + 1;
                            end

                            else if (finish % 7 == 0) begin
                                segment_posit <= segment_posit_select[0];
                                seven_segment <= 7'b1111100; // 'b'에 해당하는 7-segment 값
                                finish <= finish + 1;
                            end
                        end


                        else begin
                            segment_posit <= 8'b11111111;
                            segment_data <= 7'b0000000;
                            finish <= 0;
                            
                            inputs       <= '{'{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0}};
                            tmp_input <= '{0,0,0,0};

                            ball_count   <= '{0, 0};
                            strike_count <= '{0, 0};
                        end

                        if (strike_count == 2'b11) begin
                            success_flag <= 1'b1;
                        end
                    end
                end

                else begin // success_flag == 1'b1
                    if (success_cnt < 31760001) begin
                        music_idx <= 2;
                        full_color_greed_led <= 4'b1111;

                        if (success_cnt % 7 == 1) begin
                            segment_posit <= segment_posit_select[7];
                            seven_segment <= 7'b1101101; // S
                            success_cnt <= success_cnt + 1;
                        end
                    
                        else if (success_cnt % 7 == 2) begin
                            segment_posit <= segment_posit_select[6];
                            seven_segment <= 7'b0011100; // u
                            success_cnt <=success_cnt + 1;
                        end

                        else if (success_cnt % 7 == 3) begin
                            segment_posit <= segment_posit_select[5];
                            seven_segment <= 7'b1011000; // c
                            success_cnt <= success_cnt + 1;
                        end


                        else if (success_cnt % 7 == 4) begin
                            segment_posit <= segment_posit_select[4];
                            seven_segment <= 7'b1011000; // c
                            success_cnt <= success_cnt + 1;
                        end

                        else if (success_cnt % 7 == 5) begin
                            segment_posit <= segment_posit_select[3];
                            seven_segment <= 7'b1111001; // E
                            success_cnt <= success_cnt + 1;
                        end

                        else if (success_cnt % 7 == 6) begin
                            segment_posit <= segment_posit_select[2];
                            seven_segment <= 7'b1101101; // S
                            success_cnt <= success_cnt + 1;
                        end

                        else if (success_cnt % 7 == 0) begin
                            segment_posit <= segment_posit_select[1];
                            seven_segment <= 7'b1101101; // S
                            success_cnt <= success_cnt + 1;
                        end

                    end

                    else begin

                        segment_posit <= 8'b11111111;
                        segment_data <= 7'b0000000;
                        finish <= 0;
                        success_flag = 0;
                        
                        inputs       <= '{'{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0}};
                        tmp_input <= '{0,0,0,0};

                        gen          <= '{'{0,1,0,0}, '{0,0,1,0}, '{0,0,0,1}};// 4 2 1
                        ball_count   <= '{0, 0};
                        strike_count <= '{0, 0};
                        full_color_red_led <= 4'b0000;
                        full_color_greed_led <= 4'b0000;
                        success_cnt <= 0;
                    end
                
                end
            end

            else begin // cnt >= 10
                // music_idx <= 1;
                if (over_cnt_lose < (22319121)) begin
                    music_idx <= 1;
                    full_color_red_led <= 4'b1111;

                    if (over_cnt_lose % 7 == 1) begin
                        segment_posit <= segment_posit_select[7];
                        seven_segment <= 7'b1101110; // y
                        over_cnt_lose <= over_cnt_lose + 1;
                    end
                
                    else if (over_cnt_lose % 7 == 2) begin
                        segment_posit <= segment_posit_select[6];
                        seven_segment <= 7'b1011100; // o
                        over_cnt_lose <=over_cnt_lose + 1;
                    end

                    else if (over_cnt_lose % 7 == 3) begin
                        segment_posit <= segment_posit_select[5];
                        seven_segment <= 7'b0011100; // u
                        over_cnt_lose <= over_cnt_lose + 1;
                    end


                    else if (over_cnt_lose % 7 == 4) begin
                        segment_posit <= segment_posit_select[3];
                        seven_segment <= 7'b0111000; // L
                        over_cnt_lose <= over_cnt_lose + 1;
                    end

                    else if (over_cnt_lose % 7 == 5) begin
                        segment_posit <= segment_posit_select[2];
                        seven_segment <= 7'b1011100; // o
                        over_cnt_lose <= over_cnt_lose + 1;
                    end

                    else if (over_cnt_lose % 7 == 6) begin
                        segment_posit <= segment_posit_select[1];
                        seven_segment <= 7'b1101101; // S
                        over_cnt_lose <= over_cnt_lose + 1;
                    end

                    else if (over_cnt_lose % 7 == 0) begin
                        segment_posit <= segment_posit_select[0];
                        seven_segment <= 7'b1111001; // 'E
                        over_cnt_lose <= over_cnt_lose + 1;
                    end
                end

                else begin
                    //music_idx <= 0;
                    segment_posit <= 8'b11111111;
                    segment_data <= 7'b0000000;
                    finish <= 0;
                    
                    inputs       <= '{'{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0}};
                    tmp_input <= '{0,0,0,0};

                    gen          <= '{'{0,1,0,0}, '{0,0,1,0}, '{0,0,0,1}};// 4 2 1
                    ball_count   <= '{0, 0};
                    strike_count <= '{0, 0};
                    full_color_red_led <= 4'b1111;
                end
            end
        end

        else begin // if sharp_rst true

            music_idx = 0;

            segment_posit <= 8'b11111111;
            segment_data <= 7'b0000000;
            finish <= 0;
            
            inputs       <= '{'{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0}};
            tmp_input <= '{0,0,0,0};

            ball_count   <= '{0, 0};
            strike_count <= '{0, 0};
            cnt <= 0;

            isSeedSettingFin <= 4'b0000;
//            seed_input_flag <= 0;
            state <= 16'b0000000000000000;
            gen <= '{'{0,1,0,0}, '{0,0,1,0}, '{0,0,0,1}};

            full_color_greed_led <= 4'b0000;
            // full_color_red_led <= 4'b1111;

        end
    end
else begin // seed 설정

        if (star_next == 1'b0 && numpad != 10'b0) begin // * 안누르고 숫자패드 눌렀을때
            tmp_input <= (numpad == 10'b0000000001) ? 4'b0000 : 
                        (numpad == 10'b0000000010) ? 4'b0001 :
                        (numpad == 10'b0000000100) ? 4'b0010 :
                        (numpad == 10'b0000001000) ? 4'b0011 :
                        (numpad == 10'b0000010000) ? 4'b0100 :
                        (numpad == 10'b0000100000) ? 4'b0101 :
                        (numpad == 10'b0001000000) ? 4'b0110 :
                        (numpad == 10'b0010000000) ? 4'b0111 :
                        (numpad == 10'b0100000000) ? 4'b1000 :
                        (numpad == 10'b1000000000) ? 4'b1001 : 4'b0000;
            
            seed_input_flag = 0;
        end
        
        else if (star_next == 1'b1 && seed_input_flag == 0) begin 
            if (seed_inputs[0] == 4'b0000) begin // inputs[0]이 비어있으면
                seed_inputs[0] <= tmp_input;
                
                isSeedSettingFin[0] <= 1'b1;
                seed_input_flag = 1'b1;
            end
            else if ((seed_inputs[1] == 4'b0000)) begin
                seed_inputs[1] <= tmp_input;

                isSeedSettingFin[1] <= 1'b1;
                seed_input_flag = 1'b1;
            end
            else if (seed_inputs[2] == 4'b0000) begin
                seed_inputs[2] <= tmp_input;

                isSeedSettingFin[2] <= 1'b1;
                seed_input_flag = 1'b1;
            end

            else if (seed_inputs[3] == 4'b0000) begin
                seed_inputs[3] <= tmp_input;

                isSeedSettingFin[3] <= 1'b1;
                seed_input_flag = 1'b1;
            end
        end

        if (seed_inputs[0] != 4'b0000 && seed_inputs[1] != 4'b0000 && seed_inputs[2] != 4'b0000 && seed_inputs[3] != 4'b0000) begin // 다 채워졌을때 

            if (state == 16'b0000000000000000) begin
                state = seed_inputs;
            end

            else begin
                state = {state[14:0], state[15] ^ state[13] ^ state[12] ^ state[10]};
                gen = '{state[15:12], state[11:8], state[7:4]};

                gen[0] = (gen[0] % 9) + 1;
                gen[1] = (gen[1] % 9) + 1;
                gen[2] = (gen[2] % 9) + 1;

                
                for (int b = 0; b < 3; b++) begin

                    if (gen[0] == gen[1]) begin
                        gen[0] = (gen[0] % 9) + 1;
                        // gen[2] = (gen[2] % 9) + 1;
                    end

                    if (gen[0] == gen[2]) begin
                        gen[0] = (gen[0] % 9) + 1;
                    end

                    if (gen[1] == gen[2]) begin
                        gen[1] = (gen[1] % 9) + 1;
                    end
                end

            // isSeedSettingFin = 4'b1111;
            seed_inputs = '{'{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0}};
            tmp_input = '{0,0,0,0};

            end
        end
    end
end


PIEZO_BGMUSIC bgmusic(
    .clk(clk),
    .dipswitch_two(dipswitch_two),
    .music_idx(music_idx),
    .piezo(piezo)
);

endmodule

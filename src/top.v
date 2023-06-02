// Copyright 2023 The XLS Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

`default_nettype none

module tt_um_apu_pulse (
	input  wire [7:0] ui_in,	// Dedicated inputs
	output wire [7:0] uo_out,	// Dedicated outputs
	input  wire [7:0] uio_in,	// IOs: Input path
	output wire [7:0] uio_out,	// IOs: Output path
	output wire [7:0] uio_oe,	// IOs: Enable path (active high: 0=input, 1=output)
	input  wire       ena,
	input  wire       clk,
	input  wire       rst_n
);

   wire [10:0]		  period = {uio_in[2:0], ui_in[7:0]};
   wire			  period_valid = uio_in[5];
   wire			  period_ready;
   assign uo_out[2] = period_ready;

   wire [1:0]		  duty = uio_in[4:3];
   wire			  duty_valid = uio_in[6];
   wire			  duty_ready;
   assign uo_out[3] = duty_ready;

   wire			  signal0;
   assign uo_out[0] = signal0;
   wire			  signal0_valid;
   assign uo_out[1] = signal0_valid;
   wire			  signal0_ready = uio_in[7];

   wire			  signal1;
   assign uo_out[4] = signal1;
   wire			  signal1_valid;
   wire			  signal1_ready = uio_in[7];

   wire			  signal2;
   assign uo_out[5] = signal2;
   wire			  signal2_valid;
   wire			  signal2_ready = uio_in[7];

   wire			  signal3;
   assign uo_out[6] = signal3;
   wire			  signal3_valid;
   wire			  signal3_ready = uio_in[7];

   wire			  signal4;
   assign uo_out[7] = signal4;
   wire			  signal4_valid;
   wire			  signal4_ready = uio_in[7];

   assign uio_oe = 8'h00;

   apu_pulse apu_pulse0(.clk(clk),
			.reset(rst_n),
			.apu__period_r(period),
			.apu__period_r_vld(period_valid),
			.apu__period_r_rdy(period_ready),
			.apu__duty_r(duty),
			.apu__duty_r_vld(duty_valid),
			.apu__duty_r_rdy(duty_ready),
			.apu__output_s(signal0),
			.apu__output_s_vld(signal0_valid),
			.apu__output_s_rdy(signal0_ready));

   apu_pulse apu_pulse1(.clk(clk),
			.reset(rst_n),
			.apu__period_r(period << 1),
			.apu__period_r_vld(period_valid),
			.apu__period_r_rdy(period_ready),
			.apu__duty_r(duty),
			.apu__duty_r_vld(duty_valid),
			.apu__duty_r_rdy(duty_ready),
			.apu__output_s(signal1),
			.apu__output_s_vld(signal1_valid),
			.apu__output_s_rdy(signal1_ready));

   apu_pulse apu_pulse2(.clk(clk),
			.reset(rst_n),
			.apu__period_r(period >> 1),
			.apu__period_r_vld(period_valid),
			.apu__period_r_rdy(period_ready),
			.apu__duty_r(duty),
			.apu__duty_r_vld(duty_valid),
			.apu__duty_r_rdy(duty_ready),
			.apu__output_s(signal2),
			.apu__output_s_vld(signal2_valid),
			.apu__output_s_rdy(signal2_ready));

   apu_pulse apu_pulse3(.clk(clk),
			.reset(rst_n),
			.apu__period_r(period << 2),
			.apu__period_r_vld(period_valid),
			.apu__period_r_rdy(period_ready),
			.apu__duty_r(duty),
			.apu__duty_r_vld(duty_valid),
			.apu__duty_r_rdy(duty_ready),
			.apu__output_s(signal3),
			.apu__output_s_vld(signal3_valid),
			.apu__output_s_rdy(signal3_ready));

   apu_pulse apu_pulse4(.clk(clk),
			.reset(rst_n),
			.apu__period_r(period >> 2),
			.apu__period_r_vld(period_valid),
			.apu__period_r_rdy(period_ready),
			.apu__duty_r(duty),
			.apu__duty_r_vld(duty_valid),
			.apu__duty_r_rdy(duty_ready),
			.apu__output_s(signal4),
			.apu__output_s_vld(signal4_valid),
			.apu__output_s_rdy(signal4_ready));

endmodule // tt_um_apu_pulse

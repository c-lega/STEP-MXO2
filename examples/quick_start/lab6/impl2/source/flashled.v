// ********************************************************************
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// ********************************************************************
// File name    : flashled.v
// Module name  : flashled
// Author       : STEP
// Description  : segment initial
// Web          : www.stepfpga.com
// 
// --------------------------------------------------------------------
// Code Revision History : 
// --------------------------------------------------------------------
// Version: |Mod. Date:   |Changes Made:
// V1.0     |2017/03/02   |Initial ver
// --------------------------------------------------------------------
// Module Function:��ˮ�Ƶ����
 
module flashled (clk,rst,led);
 
	input clk,rst;						
	output [7:0] led;				
 
	wire clk1h;           //����һ���м��������ʾ��Ƶ�õ���ʱ�ӣ������������Ĵ���        
 
	//������Ƶ��ģ�飬����һ��1Hzʱ���ź�		
	divide #(.WIDTH(32),.N(12000000)) u2 (         //���ݲ���
			.clk(clk),
			.rst_n(rst),                   //�����Ķ˿��źŶ����ӵ�����õ��ź�
			.clkout(clk1h)
			);                             
 
	//1Hzʱ�������ش���ѭ����ֵ
	reg [7:0] led;	
	always@(posedge clk1h or negedge rst)
	begin
		if(!rst)
			led <= 8'b11111110;            // <=Ϊ��������ֵ
		else 
			led <= {led[0],led[7:1]};      //��ʱ����������һ�Σ�ִ��һ�θ�ֵ����ֵ������led[0]��led[7:1]����ƴ�ӳ�8λ����led���൱��ѭ������
	end	
endmodule 
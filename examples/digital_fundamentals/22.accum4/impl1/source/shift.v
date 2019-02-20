//********************************************************
//   Copyright(c)2018, STEP FPGA 
//   All rights reserved
//   File name       :   shift.v
//   Module name     :   shift
//   Author          :   STEP
//   Email           :   info@stepfpga.com
//   Data            :   2018/08/01
//   Version         :   V1.0
//   Description     :   4λ��λ�Ĵ��������ƴ������룬�������
//********************************************************

module shift
(
input wire clk,           //����ʱ��
input wire rst,			  //��λ�ź�
input wire datain,  	  //������������
output wire  [3:0] dataout 	  //�����������
);

reg [3:0] data;

always @(posedge clk)
	if(!rst)
		data <= 0;			//ͬ����λ
	else
		begin
			data[3] <= datain;		//����
			data[2] <= data[3];
			data[1] <= data[2];
			data[0] <= data[1];		//����һλ
		end
		
assign dataout = data;		//�������

endmodule
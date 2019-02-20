//********************************************************
//   Copyright(c)2018, STEP FPGA 
//   All rights reserved
//   File name       :   adder1.v
//   Module name     :   adder1
//   Author          :   STEP
//   Email           :   info@stepfpga.com
//   Data            :   2018/08/01
//   Version         :   V1.0
//   Description     :   һλȫ���������ýṹ��������ʽ
//********************************************************

module adder1
(
input wire a,           //��������ĵ�λ��λ����������Cin��a��b
input wire b,
input wire cin,
output wire sum,     //��������ĺ����λ��led
output wire cout
);
          
wire 		s1,s2,s3;   //�����м����


xor (sum,a,b,cin);      //���û��������
and (s1,a,cin);			//���û�������
and (s2,b,cin);
and (s3,a,b);
or (cout,s1,s2,s3);     //���û�������

endmodule
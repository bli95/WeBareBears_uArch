import lc3b_types::*;

module fwd_unit 
(	
	input lc3b_reg exme_dest, destmux_out, idex_src1, idex_src2, idex_dest,
	input lc3b_opcode idex_opcode,
	input logic [19:0] hold_reg_out,
	input logic exme_ld_dest, mewb_ld_dest, bit_5, bit_11, stall1,
	
	output logic [2:0] fwdAmux_sel, fwdBmux_sel, 
	output logic [1:0] fwdCmux_sel
);

always_comb
begin

	fwdAmux_sel = 2'b00;
	fwdBmux_sel = 2'b00;
	fwdCmux_sel = 2'b00;
	
	case (idex_opcode)
		op_add, op_and:
		begin
			if (bit_5 == 1'b0) begin
				if(hold_reg_out[19] && (hold_reg_out[18:16] == idex_src1 || hold_reg_out[18:16] == idex_src2)) begin
					if(hold_reg_out[18:16] == idex_src1) begin
						fwdAmux_sel = 3'b100;
					end
					if(hold_reg_out[18:16] == idex_src2) begin
						fwdBmux_sel = 3'b100;
					end
				end
				if(mewb_ld_dest && (destmux_out == idex_src1 || destmux_out == idex_src2)) begin
					if(destmux_out == idex_src1) begin
						fwdAmux_sel = 2'b11;
					end
					if(destmux_out == idex_src2) begin
						fwdBmux_sel = 2'b11;
					end
				end
				if(exme_ld_dest && (exme_dest == idex_src1 || exme_dest == idex_src2)) begin
					if(exme_dest == idex_src1) begin 
						fwdAmux_sel = 2'b10;
					end
					if(exme_dest == idex_src2) begin
						fwdBmux_sel = 2'b10;
					end
				end
			end
			else begin
				if(exme_ld_dest && (exme_dest == idex_src1)) begin
					fwdAmux_sel = 2'b10;
				end
				else if(mewb_ld_dest && (destmux_out == idex_src1)) begin
					fwdAmux_sel = 2'b11;
				end
				else if(hold_reg_out[19] && (hold_reg_out[18:16] == idex_src1)) begin
					fwdAmux_sel = 3'b100;
				end
			end
		end
		op_jsr:
		begin
			if (bit_11 == 1'b0) begin
				if(exme_ld_dest && (exme_dest == idex_src1)) begin
					fwdAmux_sel = 2'b10;
				end
				else if(mewb_ld_dest && (destmux_out == idex_src1)) begin
					fwdAmux_sel = 2'b11;
				end
				else if(hold_reg_out[19] && (hold_reg_out[18:16] == idex_src1)) begin
					fwdAmux_sel = 3'b100;
				end
			end
		end
		op_jmp, op_ldb, op_ldi, op_ldr, op_not, op_shf:
		begin
			if(exme_ld_dest && (exme_dest == idex_src1)) begin
				fwdAmux_sel = 2'b10;
			end
			else if(mewb_ld_dest && (destmux_out == idex_src1)) begin
				fwdAmux_sel = 2'b11;
			end
			else if(hold_reg_out[19] && (hold_reg_out[18:16] == idex_src1)) begin
				fwdAmux_sel = 3'b100;
			end
		end
		op_stb, op_sti, op_str:
		begin
			if(exme_ld_dest && (exme_dest == idex_dest)) begin
				if(exme_dest == idex_dest) begin
					fwdCmux_sel = 2'b01;
				end
			end
			else if(mewb_ld_dest && (destmux_out == idex_dest)) begin
				if(destmux_out == idex_dest) begin
					fwdCmux_sel = 2'b10;
				end
			end
			else if(hold_reg_out[19] && (hold_reg_out[18:16] == idex_dest)) begin
				if(hold_reg_out[18:16] == idex_dest) begin
					fwdCmux_sel = 2'b11;
				end
			end
			if(exme_ld_dest && (exme_dest == idex_src1)) begin
				if(exme_dest == idex_src1) begin
					fwdAmux_sel = 2'b10;
				end
			end
			else if (mewb_ld_dest && (destmux_out == idex_src1)) begin
				if(destmux_out == idex_src1) begin
					fwdAmux_sel = 2'b11;
				end
			end
			else if (hold_reg_out[19] && (hold_reg_out[18:16] == idex_src1)) begin
				if(hold_reg_out[18:16] == idex_src1) begin
					fwdAmux_sel = 3'b100;
				end
			end
		end
		default: ;
	endcase
	
end

endmodule : fwd_unit 
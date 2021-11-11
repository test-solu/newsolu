package com.dak.demo.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DakNaverBestDto {
	
	private int seq;
	private String categorynm;
	private String keyword;
	private String sGuid;
	private String inDate;

}

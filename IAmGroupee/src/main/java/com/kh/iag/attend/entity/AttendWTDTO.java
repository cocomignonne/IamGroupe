package com.kh.iag.attend.entity;

import lombok.Data;

@Data
public class AttendWTDTO 
{
	private String worktime_num;
	private String user_no;
	private String in_time;
	private String out_time;
	private String total_work_time;
}
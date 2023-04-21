package com.MapBoard.model;

public class MapBoardDTO {
	
	private int board_num;
	private String board_title;
	private String board_head;
	private int board_hit;
	private int board_like;
	private int board_writer;
	private String board_regdate;
	private String board_file;
	private String board_text;
	private String board_area;
	private String nick;
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_head() {
		return board_head;
	}
	public void setBoard_head(String board_head) {
		this.board_head = board_head;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public int getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(int board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public String getBoard_text() {
		return board_text;
	}
	public void setBoard_text(String board_text) {
		this.board_text = board_text;
	}
	public String getBoard_area() {
		return board_area;
	}
	public void setBoard_area(String board_area) {
		this.board_area = board_area;
	}
	
}

package com.company.dts.info.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.company.dts.board.JDBCUtil;
import com.company.dts.info.PlayerVO;

@Repository
public class PlayerDAO {
	
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	//SQL 명령어
	//SQL - 선수 통산 - 선수 전체 목록
	private final String player_List = "SELECT RANK() OVER(ORDER BY WIN DESC) 순위,NAME 이름, NICKNAME 소환사명, TEAM_ID 최근소속팀,\r\n" + 
			"  WIN+LOSE M, WIN W, LOSE L, WIN/(WIN+LOSE) WINRATE, \r\n" + 
			"KILL TK, DEATH TD, ASSIST TA, ROUND((KILL+ASSIST)/DEATH,1) KDA\r\n" + 
			"FROM PLAYER;";
	
	
	
	// 선수 등록
	
	// 선수 정보 변경
	
	// 단일 선수 정보
	
	// 전체 선수 목록
	public List<PlayerVO> getPlayerList() {
		System.out.println("DAO get playerList()");
		List<PlayerVO> list = new ArrayList<PlayerVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(player_List);
			rs = stmt.executeQuery();
			while(rs.next()) {
				PlayerVO playerVO = new PlayerVO();
				playerVO.setPlayer_rank(rs.getInt("순위"));
				playerVO.setName(rs.getString("이름"));
				playerVO.setNickname(rs.getString("소환사명"));
				playerVO.setTeam_id(rs.getString("최근소속팀"));
				playerVO.setMatch(rs.getInt("M"));
				playerVO.setWin(rs.getInt("W"));
				playerVO.setLose(rs.getInt("L"));
				playerVO.setKill(rs.getInt("TK"));
				playerVO.setDeath(rs.getInt("TD"));
				playerVO.setAssist(rs.getInt("TA"));
				playerVO.setKda(rs.getInt("KDA"));
				list.add(playerVO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return list;
	}
}

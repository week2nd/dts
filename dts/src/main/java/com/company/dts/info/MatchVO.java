package com.company.dts.info;

public class MatchVO {

	private int matchId = 0;
	
	
	private String matchdate;
	private String matchname;
	private String matchinfo;
	private String playtime;
	private String blueteamname;
	private String redteamname;
	private String blueresult;
	private String redresult;
	private String bluegamer1;
	private String bluegamer2;
	private String bluegamer3;
	private String bluegamer4;
	private String bluegamer5;
	private String redgamer1;
	private String redgamer2;
	private String redgamer3;
	private String redgamer4;
	private String redgamer5;
	private String bluepick1;
	private String bluepick2;
	private String bluepick3;
	private String bluepick4;
	private String bluepick5;
	private String redpick1;
	private String redpick2;
	private String redpick3;
	private String redpick4;
	private String redpick5;
	private String blueban1;
	private String blueban2;
	private String blueban3;
	private String blueban4;
	private String blueban5;
	private String redban1;
	private String redban2;
	private String redban3;
	private String redban4;
	private String redban5;
	private String bluepick1Spell1;
	private String bluepick1Spell2;
	private String bluepick2Spell1;
	private String bluepick2Spell2;
	private String bluepick3Spell1;
	private String bluepick3Spell2;
	private String bluepick4Spell1;
	private String bluepick4Spell2;
	private String bluepick5Spell1;
	private String bluepick5Spell2;
	private String redpick1Spell1;
	private String redpick1Spell2;
	private String redpick2Spell1;
	private String redpick2Spell2;
	private String redpick3Spell1;
	private String redpick3Spell2;
	private String redpick4Spell1;
	private String redpick4Spell2;
	private String redpick5Spell1;
	private String redpick5Spell2;
	private int bluepick1Kill = 0;
	private int bluepick1Death = 0;
	private int bluepick1Assist = 0;
	private int bluepick2Kill = 0;
	private int bluepick2Death = 0;
	private int bluepick2Assist = 0;
	private int bluepick3Kill = 0;
	private int bluepick3Death = 0;
	private int bluepick3Assist = 0;
	private int bluepick4Kill = 0;
	private int bluepick4Death = 0;
	private int bluepick4Assist = 0;
	private int bluepick5Kill = 0;
	private int bluepick5Death = 0;
	private int bluepick5Assist = 0;
	private int redpick1Kill = 0;
	private int redpick1Death = 0;
	private int redpick1Assist = 0;
	private int redpick2Kill = 0;
	private int redpick2Death = 0;
	private int redpick2Assist = 0;
	private int redpick3Kill = 0;
	private int redpick3Death = 0;
	private int redpick3Assist = 0;
	private int redpick4Kill = 0;
	private int redpick4Death = 0;
	private int redpick4Assist = 0;
	private int redpick5Kill = 0;
	private int redpick5Death = 0;
	private int redpick5Assist = 0;
	
	// 통계 데이터
	private int bluepick1Kda = 0;
	private int bluepick2Kda = 0;
	private int bluepick3Kda = 0;
	private int bluepick4Kda = 0;
	private int bluepick5Kda = 0;
	private int redpick1Kda = 0;
	private int redpick2Kda = 0;
	private int redpick3Kda = 0;
	private int redpick4Kda = 0;
	private int redpick5Kda = 0;
	private int blueteamKillsum = 0;
	private int blueteamDeathsum = 0;
	private int blueteamAssistsum = 0;
	private int blueteamKda = 0;
	private int redteamKillsum = 0;
	private int redteamDeathsum = 0;
	private int redteamAssistsum = 0;
	private int redteamKda = 0;
	

	public int getMatchId() {
		return matchId;
	}

	public void setMatchId(int matchId) {
		this.matchId = matchId;
	}

	
	public String getBlueresult() {
		return blueresult;
	}

	public void setBlueresult(String blueresult) {
		this.blueresult = blueresult;
	}

	public String getRedresult() {
		return redresult;
	}

	public void setRedresult(String redresult) {
		this.redresult = redresult;
	}

	public String getMatchdate() {
		return matchdate;
	}

	public void setMatchdate(String matchdate) {
		this.matchdate = matchdate;
	}

	public String getMatchname() {
		return matchname;
	}

	public void setMatchname(String matchname) {
		this.matchname = matchname;
	}

	public String getMatchinfo() {
		return matchinfo;
	}

	public void setMatchinfo(String matchinfo) {
		this.matchinfo = matchinfo;
	}

	public String getPlaytime() {
		return playtime;
	}

	public void setPlaytime(String playtime) {
		this.playtime = playtime;
	}

	public String getBlueteamname() {
		return blueteamname;
	}

	public void setBlueteamname(String blueteamname) {
		this.blueteamname = blueteamname;
	}

	public String getRedteamname() {
		return redteamname;
	}

	public void setRedteamname(String redteamname) {
		this.redteamname = redteamname;
	}

	public String getBluegamer1() {
		return bluegamer1;
	}

	public void setBluegamer1(String bluegamer1) {
		this.bluegamer1 = bluegamer1;
	}

	public String getBluegamer2() {
		return bluegamer2;
	}

	public void setBluegamer2(String bluegamer2) {
		this.bluegamer2 = bluegamer2;
	}

	public String getBluegamer3() {
		return bluegamer3;
	}

	public void setBluegamer3(String bluegamer3) {
		this.bluegamer3 = bluegamer3;
	}

	public String getBluegamer4() {
		return bluegamer4;
	}

	public void setBluegamer4(String bluegamer4) {
		this.bluegamer4 = bluegamer4;
	}

	public String getBluegamer5() {
		return bluegamer5;
	}

	public void setBluegamer5(String bluegamer5) {
		this.bluegamer5 = bluegamer5;
	}

	public String getRedgamer1() {
		return redgamer1;
	}

	public void setRedgamer1(String redgamer1) {
		this.redgamer1 = redgamer1;
	}

	public String getRedgamer2() {
		return redgamer2;
	}

	public void setRedgamer2(String redgamer2) {
		this.redgamer2 = redgamer2;
	}

	public String getRedgamer3() {
		return redgamer3;
	}

	public void setRedgamer3(String redgamer3) {
		this.redgamer3 = redgamer3;
	}

	public String getRedgamer4() {
		return redgamer4;
	}

	public void setRedgamer4(String redgamer4) {
		this.redgamer4 = redgamer4;
	}

	public String getRedgamer5() {
		return redgamer5;
	}

	public void setRedgamer5(String redgamer5) {
		this.redgamer5 = redgamer5;
	}

	public String getBluepick1() {
		return bluepick1;
	}

	public void setBluepick1(String bluepick1) {
		this.bluepick1 = bluepick1;
	}

	public String getBluepick2() {
		return bluepick2;
	}

	public void setBluepick2(String bluepick2) {
		this.bluepick2 = bluepick2;
	}

	public String getBluepick3() {
		return bluepick3;
	}

	public void setBluepick3(String bluepick3) {
		this.bluepick3 = bluepick3;
	}

	public String getBluepick4() {
		return bluepick4;
	}

	public void setBluepick4(String bluepick4) {
		this.bluepick4 = bluepick4;
	}

	public String getBluepick5() {
		return bluepick5;
	}

	public void setBluepick5(String bluepick5) {
		this.bluepick5 = bluepick5;
	}

	public String getRedpick1() {
		return redpick1;
	}

	public void setRedpick1(String redpick1) {
		this.redpick1 = redpick1;
	}

	public String getRedpick2() {
		return redpick2;
	}

	public void setRedpick2(String redpick2) {
		this.redpick2 = redpick2;
	}

	public String getRedpick3() {
		return redpick3;
	}

	public void setRedpick3(String redpick3) {
		this.redpick3 = redpick3;
	}

	public String getRedpick4() {
		return redpick4;
	}

	public void setRedpick4(String redpick4) {
		this.redpick4 = redpick4;
	}

	public String getRedpick5() {
		return redpick5;
	}

	public void setRedpick5(String redpick5) {
		this.redpick5 = redpick5;
	}

	public String getBlueban1() {
		return blueban1;
	}

	public void setBlueban1(String blueban1) {
		this.blueban1 = blueban1;
	}

	public String getBlueban2() {
		return blueban2;
	}

	public void setBlueban2(String blueban2) {
		this.blueban2 = blueban2;
	}

	public String getBlueban3() {
		return blueban3;
	}

	public void setBlueban3(String blueban3) {
		this.blueban3 = blueban3;
	}

	public String getBlueban4() {
		return blueban4;
	}

	public void setBlueban4(String blueban4) {
		this.blueban4 = blueban4;
	}

	public String getBlueban5() {
		return blueban5;
	}

	public void setBlueban5(String blueban5) {
		this.blueban5 = blueban5;
	}

	public String getRedban1() {
		return redban1;
	}

	public void setRedban1(String redban1) {
		this.redban1 = redban1;
	}

	public String getRedban2() {
		return redban2;
	}

	public void setRedban2(String redban2) {
		this.redban2 = redban2;
	}

	public String getRedban3() {
		return redban3;
	}

	public void setRedban3(String redban3) {
		this.redban3 = redban3;
	}

	public String getRedban4() {
		return redban4;
	}

	public void setRedban4(String redban4) {
		this.redban4 = redban4;
	}

	public String getRedban5() {
		return redban5;
	}

	public void setRedban5(String redban5) {
		this.redban5 = redban5;
	}

	public String getBluepick1Spell1() {
		return bluepick1Spell1;
	}

	public void setBluepick1Spell1(String bluepick1Spell1) {
		this.bluepick1Spell1 = bluepick1Spell1;
	}

	public String getBluepick1Spell2() {
		return bluepick1Spell2;
	}

	public void setBluepick1Spell2(String bluepick1Spell2) {
		this.bluepick1Spell2 = bluepick1Spell2;
	}

	public String getBluepick2Spell1() {
		return bluepick2Spell1;
	}

	public void setBluepick2Spell1(String bluepick2Spell1) {
		this.bluepick2Spell1 = bluepick2Spell1;
	}

	public String getBluepick2Spell2() {
		return bluepick2Spell2;
	}

	public void setBluepick2Spell2(String bluepick2Spell2) {
		this.bluepick2Spell2 = bluepick2Spell2;
	}

	public String getBluepick3Spell1() {
		return bluepick3Spell1;
	}

	public void setBluepick3Spell1(String bluepick3Spell1) {
		this.bluepick3Spell1 = bluepick3Spell1;
	}

	public String getBluepick3Spell2() {
		return bluepick3Spell2;
	}

	public void setBluepick3Spell2(String bluepick3Spell2) {
		this.bluepick3Spell2 = bluepick3Spell2;
	}

	public String getBluepick4Spell1() {
		return bluepick4Spell1;
	}

	public void setBluepick4Spell1(String bluepick4Spell1) {
		this.bluepick4Spell1 = bluepick4Spell1;
	}

	public String getBluepick4Spell2() {
		return bluepick4Spell2;
	}

	public void setBluepick4Spell2(String bluepick4Spell2) {
		this.bluepick4Spell2 = bluepick4Spell2;
	}

	public String getBluepick5Spell1() {
		return bluepick5Spell1;
	}

	public void setBluepick5Spell1(String bluepick5Spell1) {
		this.bluepick5Spell1 = bluepick5Spell1;
	}

	public String getBluepick5Spell2() {
		return bluepick5Spell2;
	}

	public void setBluepick5Spell2(String bluepick5Spell2) {
		this.bluepick5Spell2 = bluepick5Spell2;
	}

	public String getRedpick1Spell1() {
		return redpick1Spell1;
	}

	public void setRedpick1Spell1(String redpick1Spell1) {
		this.redpick1Spell1 = redpick1Spell1;
	}

	public String getRedpick1Spell2() {
		return redpick1Spell2;
	}

	public void setRedpick1Spell2(String redpick1Spell2) {
		this.redpick1Spell2 = redpick1Spell2;
	}

	public String getRedpick2Spell1() {
		return redpick2Spell1;
	}

	public void setRedpick2Spell1(String redpick2Spell1) {
		this.redpick2Spell1 = redpick2Spell1;
	}

	public String getRedpick2Spell2() {
		return redpick2Spell2;
	}

	public void setRedpick2Spell2(String redpick2Spell2) {
		this.redpick2Spell2 = redpick2Spell2;
	}

	public String getRedpick3Spell1() {
		return redpick3Spell1;
	}

	public void setRedpick3Spell1(String redpick3Spell1) {
		this.redpick3Spell1 = redpick3Spell1;
	}

	public String getRedpick3Spell2() {
		return redpick3Spell2;
	}

	public void setRedpick3Spell2(String redpick3Spell2) {
		this.redpick3Spell2 = redpick3Spell2;
	}

	public String getRedpick4Spell1() {
		return redpick4Spell1;
	}

	public void setRedpick4Spell1(String redpick4Spell1) {
		this.redpick4Spell1 = redpick4Spell1;
	}

	public String getRedpick4Spell2() {
		return redpick4Spell2;
	}

	public void setRedpick4Spell2(String redpick4Spell2) {
		this.redpick4Spell2 = redpick4Spell2;
	}

	public String getRedpick5Spell1() {
		return redpick5Spell1;
	}

	public void setRedpick5Spell1(String redpick5Spell1) {
		this.redpick5Spell1 = redpick5Spell1;
	}

	public String getRedpick5Spell2() {
		return redpick5Spell2;
	}

	public void setRedpick5Spell2(String redpick5Spell2) {
		this.redpick5Spell2 = redpick5Spell2;
	}

	public int getBluepick1Kill() {
		return bluepick1Kill;
	}

	public void setBluepick1Kill(int bluepick1Kill) {
		this.bluepick1Kill = bluepick1Kill;
	}

	public int getBluepick1Death() {
		return bluepick1Death;
	}

	public void setBluepick1Death(int bluepick1Death) {
		this.bluepick1Death = bluepick1Death;
	}

	public int getBluepick1Assist() {
		return bluepick1Assist;
	}

	public void setBluepick1Assist(int bluepick1Assist) {
		this.bluepick1Assist = bluepick1Assist;
	}

	public int getBluepick2Kill() {
		return bluepick2Kill;
	}

	public void setBluepick2Kill(int bluepick2Kill) {
		this.bluepick2Kill = bluepick2Kill;
	}

	public int getBluepick2Death() {
		return bluepick2Death;
	}

	public void setBluepick2Death(int bluepick2Death) {
		this.bluepick2Death = bluepick2Death;
	}

	public int getBluepick2Assist() {
		return bluepick2Assist;
	}

	public void setBluepick2Assist(int bluepick2Assist) {
		this.bluepick2Assist = bluepick2Assist;
	}

	public int getBluepick3Kill() {
		return bluepick3Kill;
	}

	public void setBluepick3Kill(int bluepick3Kill) {
		this.bluepick3Kill = bluepick3Kill;
	}

	public int getBluepick3Death() {
		return bluepick3Death;
	}

	public void setBluepick3Death(int bluepick3Death) {
		this.bluepick3Death = bluepick3Death;
	}

	public int getBluepick3Assist() {
		return bluepick3Assist;
	}

	public void setBluepick3Assist(int bluepick3Assist) {
		this.bluepick3Assist = bluepick3Assist;
	}

	public int getBluepick4Kill() {
		return bluepick4Kill;
	}

	public void setBluepick4Kill(int bluepick4Kill) {
		this.bluepick4Kill = bluepick4Kill;
	}

	public int getBluepick4Death() {
		return bluepick4Death;
	}

	public void setBluepick4Death(int bluepick4Death) {
		this.bluepick4Death = bluepick4Death;
	}

	public int getBluepick4Assist() {
		return bluepick4Assist;
	}

	public void setBluepick4Assist(int bluepick4Assist) {
		this.bluepick4Assist = bluepick4Assist;
	}

	public int getBluepick5Kill() {
		return bluepick5Kill;
	}

	public void setBluepick5Kill(int bluepick5Kill) {
		this.bluepick5Kill = bluepick5Kill;
	}

	public int getBluepick5Death() {
		return bluepick5Death;
	}

	public void setBluepick5Death(int bluepick5Death) {
		this.bluepick5Death = bluepick5Death;
	}

	public int getBluepick5Assist() {
		return bluepick5Assist;
	}

	public void setBluepick5Assist(int bluepick5Assist) {
		this.bluepick5Assist = bluepick5Assist;
	}

	public int getRedpick1Kill() {
		return redpick1Kill;
	}

	public void setRedpick1Kill(int redpick1Kill) {
		this.redpick1Kill = redpick1Kill;
	}

	public int getRedpick1Death() {
		return redpick1Death;
	}

	public void setRedpick1Death(int redpick1Death) {
		this.redpick1Death = redpick1Death;
	}

	public int getRedpick1Assist() {
		return redpick1Assist;
	}

	public void setRedpick1Assist(int redpick1Assist) {
		this.redpick1Assist = redpick1Assist;
	}

	public int getRedpick2Kill() {
		return redpick2Kill;
	}

	public void setRedpick2Kill(int redpick2Kill) {
		this.redpick2Kill = redpick2Kill;
	}

	public int getRedpick2Death() {
		return redpick2Death;
	}

	public void setRedpick2Death(int redpick2Death) {
		this.redpick2Death = redpick2Death;
	}

	public int getRedpick2Assist() {
		return redpick2Assist;
	}

	public void setRedpick2Assist(int redpick2Assist) {
		this.redpick2Assist = redpick2Assist;
	}

	public int getRedpick3Kill() {
		return redpick3Kill;
	}

	public void setRedpick3Kill(int redpick3Kill) {
		this.redpick3Kill = redpick3Kill;
	}

	public int getRedpick3Death() {
		return redpick3Death;
	}

	public void setRedpick3Death(int redpick3Death) {
		this.redpick3Death = redpick3Death;
	}

	public int getRedpick3Assist() {
		return redpick3Assist;
	}

	public void setRedpick3Assist(int redpick3Assist) {
		this.redpick3Assist = redpick3Assist;
	}

	public int getRedpick4Kill() {
		return redpick4Kill;
	}

	public void setRedpick4Kill(int redpick4Kill) {
		this.redpick4Kill = redpick4Kill;
	}

	public int getRedpick4Death() {
		return redpick4Death;
	}

	public void setRedpick4Death(int redpick4Death) {
		this.redpick4Death = redpick4Death;
	}

	public int getRedpick4Assist() {
		return redpick4Assist;
	}

	public void setRedpick4Assist(int redpick4Assist) {
		this.redpick4Assist = redpick4Assist;
	}

	public int getRedpick5Kill() {
		return redpick5Kill;
	}

	public void setRedpick5Kill(int redpick5Kill) {
		this.redpick5Kill = redpick5Kill;
	}

	public int getRedpick5Death() {
		return redpick5Death;
	}

	public void setRedpick5Death(int redpick5Death) {
		this.redpick5Death = redpick5Death;
	}

	public int getRedpick5Assist() {
		return redpick5Assist;
	}

	public void setRedpick5Assist(int redpick5Assist) {
		this.redpick5Assist = redpick5Assist;
	}

}

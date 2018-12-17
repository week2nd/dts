package com.company.dts.info;

public class MatchVO {

	private int gameId;
	private String uId;
	
	private float redRate;
	private float blueRate;
	private String gameStatus;
	private int buyCheck;
	private String gameDate;
	private String gameDate;
	private String gameName;
	private String gameInfo;
	private String playTime;
	private String blueTeamName;
	private String redTeamName;
	private String blueResult;
	private String redResult;
	private String blueGamer1;
	private String blueGamer2;
	private String blueGamer3;
	private String blueGamer4;
	private String blueGamer5;
	private String redGamer1;
	private String redGamer2;
	private String redGamer3;
	private String redGamer4;
	private String redGamer5;
	private String bluePick1;
	private String bluePick2;
	private String bluePick3;
	private String bluePick4;
	private String bluePick5;
	private String redPick1;
	private String redPick2;
	private String redPick3;
	private String redPick4;
	private String redPick5;
	private String blueBan1;
	private String blueBan2;
	private String blueBan3;
	private String blueBan4;
	private String blueBan5;
	private String redBan1;
	private String redBan2;
	private String redBan3;
	private String redBan4;
	private String redBan5;
	private String bluePick1Spell1;
	private String bluePick1Spell2;
	private String bluePick2Spell1;
	private String bluePick2Spell2;
	private String bluePick3Spell1;
	private String bluePick3Spell2;
	private String bluePick4Spell1;
	private String bluePick4Spell2;
	private String bluePick5Spell1;
	private String bluePick5Spell2;
	private String redPick1Spell1;
	private String redPick1Spell2;
	private String redPick2Spell1;
	private String redPick2Spell2;
	private String redPick3Spell1;
	private String redPick3Spell2;
	private String redPick4Spell1;
	private String redPick4Spell2;
	private String redPick5Spell1;
	private String redPick5Spell2;
	private int bluePick1Kill = 0;
	private int bluePick1Death = 0;
	private int bluePick1Assist = 0;
	private int bluePick2Kill = 0;
	private int bluePick2Death = 0;
	private int bluePick2Assist = 0;
	private int bluePick3Kill = 0;
	private int bluePick3Death = 0;
	private int bluePick3Assist = 0;
	private int bluePick4Kill = 0;
	private int bluePick4Death = 0;
	private int bluePick4Assist = 0;
	private int bluePick5Kill = 0;
	private int bluePick5Death = 0;
	private int bluePick5Assist = 0;
	private int redPick1Kill = 0;
	private int redPick1Death = 0;
	private int redPick1Assist = 0;
	private int redPick2Kill = 0;
	private int redPick2Death = 0;
	private int redPick2Assist = 0;
	private int redPick3Kill = 0;
	private int redPick3Death = 0;
	private int redPick3Assist = 0;
	private int redPick4Kill = 0;
	private int redPick4Death = 0;
	private int redPick4Assist = 0;
	private int redPick5Kill = 0;
	private int redPick5Death = 0;
	private int redPick5Assist = 0;
	
	// 통계 데이터
	private int bluePick1Kda = 0;
	private int bluePick2Kda = 0;
	private int bluePick3Kda = 0;
	private int bluePick4Kda = 0;
	private int bluePick5Kda = 0;
	private int redPick1Kda = 0;
	private int redPick2Kda = 0;
	private int redPick3Kda = 0;
	private int redPick4Kda = 0;
	private int redPick5Kda = 0;
	private int blueTeamKillsum = 0;
	private int blueTeamDeathsum = 0;
	private int blueTeamAssistsum = 0;
	private int blueTeamKda = 0;
	private int redTeamKillsum = 0;
	private int redTeamDeathsum = 0;
	private int redTeamAssistsum = 0;
	private int redTeamKda = 0;
	

	public int getgameId() {
		return gameId;
	}

	public void setgameId(int gameId) {
		this.gameId = gameId;
	}

	
	public String getBlueResult() {
		return blueResult;
	}

	public void setBlueResult(String blueResult) {
		this.blueResult = blueResult;
	}

	public String getRedResult() {
		return redResult;
	}

	public void setRedResult(String redResult) {
		this.redResult = redResult;
	}

	public String getgameDate() {
		return gameDate;
	}

	public void setgameDate(String gameDate) {
		this.gameDate = gameDate;
	}

	public String getgameName() {
		return gameName;
	}

	public void setgameName(String gameName) {
		this.gameName = gameName;
	}

	public String getgameInfo() {
		return gameInfo;
	}

	public void setgameInfo(String gameInfo) {
		this.gameInfo = gameInfo;
	}

	public String getPlayTime() {
		return playTime;
	}

	public void setPlayTime(String playTime) {
		this.playTime = playTime;
	}

	public String getBlueTeamName() {
		return blueTeamName;
	}

	public void setBlueTeamName(String blueTeamName) {
		this.blueTeamName = blueTeamName;
	}

	public String getRedTeamName() {
		return redTeamName;
	}

	public void setRedTeamName(String redTeamName) {
		this.redTeamName = redTeamName;
	}

	public String getBlueGamer1() {
		return blueGamer1;
	}

	public void setBlueGamer1(String blueGamer1) {
		this.blueGamer1 = blueGamer1;
	}

	public String getBlueGamer2() {
		return blueGamer2;
	}

	public void setBlueGamer2(String blueGamer2) {
		this.blueGamer2 = blueGamer2;
	}

	public String getBlueGamer3() {
		return blueGamer3;
	}

	public void setBlueGamer3(String blueGamer3) {
		this.blueGamer3 = blueGamer3;
	}

	public String getBlueGamer4() {
		return blueGamer4;
	}

	public void setBlueGamer4(String blueGamer4) {
		this.blueGamer4 = blueGamer4;
	}

	public String getBlueGamer5() {
		return blueGamer5;
	}

	public void setBlueGamer5(String blueGamer5) {
		this.blueGamer5 = blueGamer5;
	}

	public String getRedGamer1() {
		return redGamer1;
	}

	public void setRedGamer1(String redGamer1) {
		this.redGamer1 = redGamer1;
	}

	public String getRedGamer2() {
		return redGamer2;
	}

	public void setRedGamer2(String redGamer2) {
		this.redGamer2 = redGamer2;
	}

	public String getRedGamer3() {
		return redGamer3;
	}

	public void setRedGamer3(String redGamer3) {
		this.redGamer3 = redGamer3;
	}

	public String getRedGamer4() {
		return redGamer4;
	}

	public void setRedGamer4(String redGamer4) {
		this.redGamer4 = redGamer4;
	}

	public String getRedGamer5() {
		return redGamer5;
	}

	public void setRedGamer5(String redGamer5) {
		this.redGamer5 = redGamer5;
	}

	public String getBluePick1() {
		return bluePick1;
	}

	public void setBluePick1(String bluePick1) {
		this.bluePick1 = bluePick1;
	}

	public String getBluePick2() {
		return bluePick2;
	}

	public void setBluePick2(String bluePick2) {
		this.bluePick2 = bluePick2;
	}

	public String getBluePick3() {
		return bluePick3;
	}

	public void setBluePick3(String bluePick3) {
		this.bluePick3 = bluePick3;
	}

	public String getBluePick4() {
		return bluePick4;
	}

	public void setBluePick4(String bluePick4) {
		this.bluePick4 = bluePick4;
	}

	public String getBluePick5() {
		return bluePick5;
	}

	public void setBluePick5(String bluePick5) {
		this.bluePick5 = bluePick5;
	}

	public String getRedPick1() {
		return redPick1;
	}

	public void setRedPick1(String redPick1) {
		this.redPick1 = redPick1;
	}

	public String getRedPick2() {
		return redPick2;
	}

	public void setRedPick2(String redPick2) {
		this.redPick2 = redPick2;
	}

	public String getRedPick3() {
		return redPick3;
	}

	public void setRedPick3(String redPick3) {
		this.redPick3 = redPick3;
	}

	public String getRedPick4() {
		return redPick4;
	}

	public void setRedPick4(String redPick4) {
		this.redPick4 = redPick4;
	}

	public String getRedPick5() {
		return redPick5;
	}

	public void setRedPick5(String redPick5) {
		this.redPick5 = redPick5;
	}

	public String getBlueBan1() {
		return blueBan1;
	}

	public void setBlueBan1(String blueBan1) {
		this.blueBan1 = blueBan1;
	}

	public String getBlueBan2() {
		return blueBan2;
	}

	public void setBlueBan2(String blueBan2) {
		this.blueBan2 = blueBan2;
	}

	public String getBlueBan3() {
		return blueBan3;
	}

	public void setBlueBan3(String blueBan3) {
		this.blueBan3 = blueBan3;
	}

	public String getBlueBan4() {
		return blueBan4;
	}

	public void setBlueBan4(String blueBan4) {
		this.blueBan4 = blueBan4;
	}

	public String getBlueBan5() {
		return blueBan5;
	}

	public void setBlueBan5(String blueBan5) {
		this.blueBan5 = blueBan5;
	}

	public String getRedBan1() {
		return redBan1;
	}

	public void setRedBan1(String redBan1) {
		this.redBan1 = redBan1;
	}

	public String getRedBan2() {
		return redBan2;
	}

	public void setRedBan2(String redBan2) {
		this.redBan2 = redBan2;
	}

	public String getRedBan3() {
		return redBan3;
	}

	public void setRedBan3(String redBan3) {
		this.redBan3 = redBan3;
	}

	public String getRedBan4() {
		return redBan4;
	}

	public void setRedBan4(String redBan4) {
		this.redBan4 = redBan4;
	}

	public String getRedBan5() {
		return redBan5;
	}

	public void setRedBan5(String redBan5) {
		this.redBan5 = redBan5;
	}

	public String getBluePick1Spell1() {
		return bluePick1Spell1;
	}

	public void setBluePick1Spell1(String bluePick1Spell1) {
		this.bluePick1Spell1 = bluePick1Spell1;
	}

	public String getBluePick1Spell2() {
		return bluePick1Spell2;
	}

	public void setBluePick1Spell2(String bluePick1Spell2) {
		this.bluePick1Spell2 = bluePick1Spell2;
	}

	public String getBluePick2Spell1() {
		return bluePick2Spell1;
	}

	public void setBluePick2Spell1(String bluePick2Spell1) {
		this.bluePick2Spell1 = bluePick2Spell1;
	}

	public String getBluePick2Spell2() {
		return bluePick2Spell2;
	}

	public void setBluePick2Spell2(String bluePick2Spell2) {
		this.bluePick2Spell2 = bluePick2Spell2;
	}

	public String getBluePick3Spell1() {
		return bluePick3Spell1;
	}

	public void setBluePick3Spell1(String bluePick3Spell1) {
		this.bluePick3Spell1 = bluePick3Spell1;
	}

	public String getBluePick3Spell2() {
		return bluePick3Spell2;
	}

	public void setBluePick3Spell2(String bluePick3Spell2) {
		this.bluePick3Spell2 = bluePick3Spell2;
	}

	public String getBluePick4Spell1() {
		return bluePick4Spell1;
	}

	public void setBluePick4Spell1(String bluePick4Spell1) {
		this.bluePick4Spell1 = bluePick4Spell1;
	}

	public String getBluePick4Spell2() {
		return bluePick4Spell2;
	}

	public void setBluePick4Spell2(String bluePick4Spell2) {
		this.bluePick4Spell2 = bluePick4Spell2;
	}

	public String getBluePick5Spell1() {
		return bluePick5Spell1;
	}

	public void setBluePick5Spell1(String bluePick5Spell1) {
		this.bluePick5Spell1 = bluePick5Spell1;
	}

	public String getBluePick5Spell2() {
		return bluePick5Spell2;
	}

	public void setBluePick5Spell2(String bluePick5Spell2) {
		this.bluePick5Spell2 = bluePick5Spell2;
	}

	public String getRedPick1Spell1() {
		return redPick1Spell1;
	}

	public void setRedPick1Spell1(String redPick1Spell1) {
		this.redPick1Spell1 = redPick1Spell1;
	}

	public String getRedPick1Spell2() {
		return redPick1Spell2;
	}

	public void setRedPick1Spell2(String redPick1Spell2) {
		this.redPick1Spell2 = redPick1Spell2;
	}

	public String getRedPick2Spell1() {
		return redPick2Spell1;
	}

	public void setRedPick2Spell1(String redPick2Spell1) {
		this.redPick2Spell1 = redPick2Spell1;
	}

	public String getRedPick2Spell2() {
		return redPick2Spell2;
	}

	public void setRedPick2Spell2(String redPick2Spell2) {
		this.redPick2Spell2 = redPick2Spell2;
	}

	public String getRedPick3Spell1() {
		return redPick3Spell1;
	}

	public void setRedPick3Spell1(String redPick3Spell1) {
		this.redPick3Spell1 = redPick3Spell1;
	}

	public String getRedPick3Spell2() {
		return redPick3Spell2;
	}

	public void setRedPick3Spell2(String redPick3Spell2) {
		this.redPick3Spell2 = redPick3Spell2;
	}

	public String getRedPick4Spell1() {
		return redPick4Spell1;
	}

	public void setRedPick4Spell1(String redPick4Spell1) {
		this.redPick4Spell1 = redPick4Spell1;
	}

	public String getRedPick4Spell2() {
		return redPick4Spell2;
	}

	public void setRedPick4Spell2(String redPick4Spell2) {
		this.redPick4Spell2 = redPick4Spell2;
	}

	public String getRedPick5Spell1() {
		return redPick5Spell1;
	}

	public void setRedPick5Spell1(String redPick5Spell1) {
		this.redPick5Spell1 = redPick5Spell1;
	}

	public String getRedPick5Spell2() {
		return redPick5Spell2;
	}

	public void setRedPick5Spell2(String redPick5Spell2) {
		this.redPick5Spell2 = redPick5Spell2;
	}

	public int getBluePick1Kill() {
		return bluePick1Kill;
	}

	public void setBluePick1Kill(int bluePick1Kill) {
		this.bluePick1Kill = bluePick1Kill;
	}

	public int getBluePick1Death() {
		return bluePick1Death;
	}

	public void setBluePick1Death(int bluePick1Death) {
		this.bluePick1Death = bluePick1Death;
	}

	public int getBluePick1Assist() {
		return bluePick1Assist;
	}

	public void setBluePick1Assist(int bluePick1Assist) {
		this.bluePick1Assist = bluePick1Assist;
	}

	public int getBluePick2Kill() {
		return bluePick2Kill;
	}

	public void setBluePick2Kill(int bluePick2Kill) {
		this.bluePick2Kill = bluePick2Kill;
	}

	public int getBluePick2Death() {
		return bluePick2Death;
	}

	public void setBluePick2Death(int bluePick2Death) {
		this.bluePick2Death = bluePick2Death;
	}

	public int getBluePick2Assist() {
		return bluePick2Assist;
	}

	public void setBluePick2Assist(int bluePick2Assist) {
		this.bluePick2Assist = bluePick2Assist;
	}

	public int getBluePick3Kill() {
		return bluePick3Kill;
	}

	public void setBluePick3Kill(int bluePick3Kill) {
		this.bluePick3Kill = bluePick3Kill;
	}

	public int getBluePick3Death() {
		return bluePick3Death;
	}

	public void setBluePick3Death(int bluePick3Death) {
		this.bluePick3Death = bluePick3Death;
	}

	public int getBluePick3Assist() {
		return bluePick3Assist;
	}

	public void setBluePick3Assist(int bluePick3Assist) {
		this.bluePick3Assist = bluePick3Assist;
	}

	public int getBluePick4Kill() {
		return bluePick4Kill;
	}

	public void setBluePick4Kill(int bluePick4Kill) {
		this.bluePick4Kill = bluePick4Kill;
	}

	public int getBluePick4Death() {
		return bluePick4Death;
	}

	public void setBluePick4Death(int bluePick4Death) {
		this.bluePick4Death = bluePick4Death;
	}

	public int getBluePick4Assist() {
		return bluePick4Assist;
	}

	public void setBluePick4Assist(int bluePick4Assist) {
		this.bluePick4Assist = bluePick4Assist;
	}

	public int getBluePick5Kill() {
		return bluePick5Kill;
	}

	public void setBluePick5Kill(int bluePick5Kill) {
		this.bluePick5Kill = bluePick5Kill;
	}

	public int getBluePick5Death() {
		return bluePick5Death;
	}

	public void setBluePick5Death(int bluePick5Death) {
		this.bluePick5Death = bluePick5Death;
	}

	public int getBluePick5Assist() {
		return bluePick5Assist;
	}

	public void setBluePick5Assist(int bluePick5Assist) {
		this.bluePick5Assist = bluePick5Assist;
	}

	public int getRedPick1Kill() {
		return redPick1Kill;
	}

	public void setRedPick1Kill(int redPick1Kill) {
		this.redPick1Kill = redPick1Kill;
	}

	public int getRedPick1Death() {
		return redPick1Death;
	}

	public void setRedPick1Death(int redPick1Death) {
		this.redPick1Death = redPick1Death;
	}

	public int getRedPick1Assist() {
		return redPick1Assist;
	}

	public void setRedPick1Assist(int redPick1Assist) {
		this.redPick1Assist = redPick1Assist;
	}

	public int getRedPick2Kill() {
		return redPick2Kill;
	}

	public void setRedPick2Kill(int redPick2Kill) {
		this.redPick2Kill = redPick2Kill;
	}

	public int getRedPick2Death() {
		return redPick2Death;
	}

	public void setRedPick2Death(int redPick2Death) {
		this.redPick2Death = redPick2Death;
	}

	public int getRedPick2Assist() {
		return redPick2Assist;
	}

	public void setRedPick2Assist(int redPick2Assist) {
		this.redPick2Assist = redPick2Assist;
	}

	public int getRedPick3Kill() {
		return redPick3Kill;
	}

	public void setRedPick3Kill(int redPick3Kill) {
		this.redPick3Kill = redPick3Kill;
	}

	public int getRedPick3Death() {
		return redPick3Death;
	}

	public void setRedPick3Death(int redPick3Death) {
		this.redPick3Death = redPick3Death;
	}

	public int getRedPick3Assist() {
		return redPick3Assist;
	}

	public void setRedPick3Assist(int redPick3Assist) {
		this.redPick3Assist = redPick3Assist;
	}

	public int getRedPick4Kill() {
		return redPick4Kill;
	}

	public void setRedPick4Kill(int redPick4Kill) {
		this.redPick4Kill = redPick4Kill;
	}

	public int getRedPick4Death() {
		return redPick4Death;
	}

	public void setRedPick4Death(int redPick4Death) {
		this.redPick4Death = redPick4Death;
	}

	public int getRedPick4Assist() {
		return redPick4Assist;
	}

	public void setRedPick4Assist(int redPick4Assist) {
		this.redPick4Assist = redPick4Assist;
	}

	public int getRedPick5Kill() {
		return redPick5Kill;
	}

	public void setRedPick5Kill(int redPick5Kill) {
		this.redPick5Kill = redPick5Kill;
	}

	public int getRedPick5Death() {
		return redPick5Death;
	}

	public void setRedPick5Death(int redPick5Death) {
		this.redPick5Death = redPick5Death;
	}

	public int getRedPick5Assist() {
		return redPick5Assist;
	}

	public void setRedPick5Assist(int redPick5Assist) {
		this.redPick5Assist = redPick5Assist;
	}

}

package DAO;

import util.BaseDAO;

public class UsercollectDAO extends BaseDAO{
//	插入收藏
	public int insertShouC(int uid, int pid) {
	    String sql = "SELECT * FROM user_collect WHERE user_id = ? AND information_id = ?";
	    // 检查是否已经存在相同的uid和pid
	    if (this.singleObject(sql, uid, pid) != null) {
	        // 如果已经存在相同的uid和pid，则不插入数据
	        return 0;
	    } else {
	        String sql2 = "INSERT INTO user_collect VALUES(NULL,?,?,NOW())";
	        // 插入新的uid和pid
	        return this.execute(sql2, uid, pid);
	    }
	}
	
	
}

package util;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface Mapper<E> {
	/**
	 * 将ResultSet 转换成list 需要由子类实现
	 * @param <E>
	 * @param rs
	 * @return
	 * @throws SQLException 
	 */
	public abstract List<E> mapper(ResultSet rs) throws SQLException;
}

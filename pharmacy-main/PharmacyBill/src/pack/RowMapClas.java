package pack;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RowMapClas implements RowMapper<Medicine> {

	@Override
	public Medicine mapRow(ResultSet rs, int rowNum) throws SQLException {
		Medicine med = new Medicine();
		med.setMedName(rs.getString(2));
		med.setBatchNo(rs.getString(3));
		med.setDate(rs.getString(4));
		med.setPrice(rs.getDouble(5));
		return med;
	}

}

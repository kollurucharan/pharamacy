package pack;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class DaoImp implements PharmacyDao {
	JdbcTemplate jdbc;

	@Autowired
	public DaoImp(DataSource dataSource) {
		jdbc = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Medicine> getAllMedicine() {
		return jdbc.query("select * from rhcvpharmacy", new RowMapClas());
	}

}

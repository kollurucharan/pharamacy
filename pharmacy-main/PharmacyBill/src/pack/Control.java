package pack;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Control {
	PharmacyDao dao;

	@Autowired
	public Control(PharmacyDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/bill", method = RequestMethod.GET)
	public String user(Model model) {
		ArrayList<Medicine> medlist = (ArrayList<Medicine>) dao.getAllMedicine();
		model.addAttribute("alist", medlist);
		for (Medicine m : medlist) {
			System.out.println(m.getMedName());
		}

		model.addAttribute("billno", "11");
		return "pharm";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String user1(Model model) {
		ArrayList<Medicine> medlist = (ArrayList<Medicine>) dao.getAllMedicine();
		model.addAttribute("alist", medlist);
		return "NewFile";
	}

}

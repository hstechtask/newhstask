package com.springmvc;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class Webappcontroller {
	private static final String POST = null;
	@Autowired
	HsDao dao;

	@RequestMapping("check")
	public String getcheck() {
		return "Index";
	}

	@RequestMapping("register")
	public String getUsersignuppage() {
		return "userregistration1";
	}

	@RequestMapping("reguser")
	public String getreguser() {
		return "check";
	}

	@RequestMapping(value = "checkemail", method = RequestMethod.POST)
	public String getcheckemail() {
		return "checkemail";
	}

	@RequestMapping("admin")
	public String getadmin(HttpSession session) {
		List<Modaltask> task = dao.admintbl();
		session.setAttribute("task", task);
		List<Student> task2 = dao.usernametbl();
		session.setAttribute("task2", task2);
		return "admin";
	}

	@RequestMapping(value = "studentregistration", method = RequestMethod.POST)
	public String getStudentRegistration(@ModelAttribute("student") Student student, HttpSession session) {
		try {
			List<Student> emaillist = dao.checkemail(student);
			if (emaillist == null) {

				Random random = new Random();
				int num = random.nextInt(899999);
				int otp = num + 100000;
				student.setOtp(otp);
				int status = dao.addstudent(student);
				dao.sendverEmail(student);
				session.setAttribute("sesreg", "success");
				return "otppage";

			} else {

				session.setAttribute("checkemail", "checkemail");
				return "userregistration1";
			}
		}
        catch(Exception e) {
		System.out.println(e.getMessage());	
      	}
		return null;
		
	}

	@RequestMapping(value = "verifyotp", method = RequestMethod.POST)
	public String getOTPverify(@RequestParam("newotp") String newotp, HttpSession session) {
		int status = dao.updateotp(newotp);

		if (status > 0) {
			session.setAttribute("sesreg", "success");
			return "redirect:/check";
		} else {

			session.setAttribute("sesreg", "success");
			return "otppage";
		}
	}

	@RequestMapping(value = "forgetpass")
	public String getForgetpass() {

		return "forgetpass";
	}

	@RequestMapping(value = "forget", method = RequestMethod.POST)
	public String getforget(@ModelAttribute("student") Student student, HttpSession session) {
		try {
			Random random = new Random();
			int num = random.nextInt(899999);
			int otp = num + 100000;
			student.setOtp(otp);
			int status = dao.updateotpotpformail(student, otp);
			dao.sendOTPtoEmail(student);
			session.setAttribute("updateotp", "updateotp");
			session.setAttribute("username", student.getStuEmail());
		}
        catch(Exception e) {
		System.out.println(e.getMessage());	
	    }
		
		return "forgetotppage";
	}

	@RequestMapping(value = "otpverify", method = RequestMethod.POST)
	public String getotpverify(@ModelAttribute("user") UserModel user, HttpSession session,
			@RequestParam("newotp") String newotp, @ModelAttribute("student") Student student) {
		try {
			List<Student> studentlist = dao.newotpverify(newotp, student);

			if (studentlist == null) {
				session.setAttribute("nopassword", "nopassword");
				return "redirect:/check";
			} else {

				session.setAttribute("password", "password");
				session.setAttribute("loginsuccess", user.getUsername());
				return "redirect:/check";
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());	
		}
		return "redirect:/check";
	}

	@RequestMapping("changepass")
	public String getchagepass() {
		return "changepass";
	}

	@RequestMapping(value = "change", method = RequestMethod.POST)
	public String getchange(@ModelAttribute("student") Student student, HttpSession session) {
		List<Student> studentlist = dao.change(student);
		if (studentlist == null) {
			session.setAttribute("nopassword", "nopassword");
			return "changepass";
		} else {

			session.setAttribute("loginsuccess", student.getStuEmail());
			return "changepassword";
		}

	}

	@RequestMapping(value = "/updatepass/{loginsuccess:.+}", method = RequestMethod.POST)
	public String getupdatepass(@PathVariable String loginsuccess, @ModelAttribute("student") Student student,
			HttpSession session, @RequestParam("password") String password) {
		int status = dao.updatepass(loginsuccess, password);
		System.out.println("email" + loginsuccess);
		System.out.println("password:" + password);
		session.setAttribute("updatepass", "updatepass");
		return "redirect:/check";
	}

	@RequestMapping(value = "adminlogin", method = RequestMethod.POST)
	public String adminlogin(@ModelAttribute("user") UserModel user, Model model, HttpSession session) {
		List<Student> studentlist = dao.adminlogin(user);
		if (studentlist == null) {
			session.setAttribute("loginsuccess", "login failed");
			return "redirect:/check";
		} else {

			session.setAttribute("loginsuccess", user.getUsername());
			return "redirect:/admin";
		}

	}

	@RequestMapping(value = "dologin", method = RequestMethod.POST)
	public String doLogin(@ModelAttribute("user") UserModel user, Model model, HttpSession session) {
		List<Student> studentlist = dao.doLogin(user);
		if (studentlist == null) {
			session.setAttribute("loginsuccess", "login failed");
			return "redirect:/check";
		} else {

			session.setAttribute("loginsuccess", user.getUsername());
			return "redirect:/reguser";
		}

	}

	@RequestMapping(value = "taskdetail", method = RequestMethod.POST)
	public String gettaskdetail(@ModelAttribute("task") Modaltask task, HttpSession session) {
		dao.entertask(task);
		dao.uploadfile(task, session);
		session.setAttribute("taskd", "taskd");
		return "redirect:/reguser";

	}

	@RequestMapping("logout")
	public String getlogout() {
		return "redirect:/check";
	}

	@RequestMapping("/editremark/{id}")
	public String geteditramark(@PathVariable("id") int id, Model model) {
		List<Modaltask> modaltasks = dao.editremark(id);
		model.addAttribute("command", modaltasks);
		model.addAttribute("handlers", modaltasks);
		return "editremark";
	}

	@RequestMapping("/deleteremark/{id}")
	public String getdeleteramark(@PathVariable("id") int id, HttpSession session) {

		int status = dao.deleteremark(id);
		session.setAttribute("taskd", "taskd");
		return "redirect:/admin";
	}

	@RequestMapping(value = "sendemail", method = RequestMethod.POST)
	public String getsendemail(@ModelAttribute("task") Modaltask task, HttpSession session) {
		try {
			
			int status = dao.addremark(task);
			dao.sendemail(task);
			session.setAttribute("sendemail", "sendemail");
			System.out.println("subject::"+task.getUsername());
			int status1 = dao.updatestatus(task);
			return "redirect:/admin";
		}
		catch(Exception e) {
			System.out.println(e.getMessage());	
		}
		
		return "redirect:/admin";
	}

	@RequestMapping(value = " /remarkby/{loginsuccess:.+}")
	public String getremarkby(@PathVariable String loginsuccess, Model model, HttpSession session) {
		List<Modaltask> modaltasks = dao.remarkby(loginsuccess);
		session.setAttribute("modaltask", modaltasks);
		// System.out.println("username" + loginsuccess);
		return "redirect:/reguser";
	}

	@RequestMapping(value = "/sendEmailAttachment", method = RequestMethod.POST)
	public String sendMailAttachment(@ModelAttribute("mailattach") MailModelAttachment mailattach,
			HttpSession session) {
		
		try {
			CommonsMultipartFile filename = mailattach.getFile();
			// String fname = filename.getOriginalFilename();
			dao.sendMailAttachment(mailattach, filename);
		}
		catch(Exception e) {
			System.out.println(e.getMessage());	
		}
		System.out.println("subject::"+mailattach.getSubject()+"to::"+mailattach.getTo());
		session.setAttribute("sendattach", "sendattach");
		return "redirect:/admin";
	}

	@RequestMapping(value = " /viewimage/{filename:.+}")
	public String getview(@PathVariable("filename") String filename, HttpSession session) {
		// List<Modaltask> modaltasks = dao.imgview(username);
		// session.setAttribute("modaltask", modaltasks);
		session.setAttribute("filename", filename);
		System.out.println("" + filename);
		return "viewimg";
	}

}

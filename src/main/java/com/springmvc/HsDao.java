package com.springmvc;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.InputStreamSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class HsDao {

	private JdbcTemplate jdbcTemplate;
	private MailSender mailsender;
	JavaMailSender javaMailSender;

	public JavaMailSender getJavaMailSender() {
		return javaMailSender;
	}

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
 
	public void setMailsender(MailSender mailsender) {
		this.mailsender = mailsender;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int addstudent(Student student) {
		String sql = "insert into sturegister(name,email,phone,password,dob,address,subject,gender,city,otp,status) values('"
				+ student.getStuName() + "','" + student.getStuEmail() + "','" + student.getStuPhone() + "','"
				+ student.getStuPassword() + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null
				+ "','" + student.getOtp() + "','0')";
		return jdbcTemplate.update(sql);
	}

	public void sendverEmail(Student student) {
		// TODO Auto-generated method stub
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("hstechtask@gmail.com");
		message.setTo(student.getStuEmail());
		message.setSubject("Email Verification");
		message.setText("Your OTP is " + student.getOtp());
		mailsender.send(message);
	}

	public int updateotp(String newotp) {
		String sql = "update sturegister set status='1' where otp='" + newotp + "'";

		return jdbcTemplate.update(sql);
	}

	public List<Student> doLogin(UserModel user) {
		// TODO Auto-generated method stub
		List<Student> studentlist = jdbcTemplate.query("select * from sturegister where email='" + user.getUsername()
				+ "' and password='" + user.getPassword() + "' and status='1' ", new RowMapper<Student>() {

					@Override
					public Student mapRow(ResultSet rs, int arg1) throws SQLException {
						// TODO Auto-generated method stub
						Student student = new Student();
						student.setStuEmail(rs.getString("email"));
						student.setStuPassword(rs.getString("password"));

						return student;

					}

				});
		return studentlist.size() > 0 ? studentlist : null;
	}

	public int entertask(Modaltask task) {
		CommonsMultipartFile file = task.getFile();
		String filnameString = file.getOriginalFilename();
		String sql = "insert into taskdetail(task,taskdetail,tasktime,username,filename,status) values('"
				+ task.getTask() + "','" + task.getTaskdetail() + "','" + task.getTasktime() + "','"
				+ task.getUsername() + "','" + filnameString + "','0') ";
		return jdbcTemplate.update(sql);
	}

	public void uploadfile(Modaltask task, HttpSession session) {
		CommonsMultipartFile file = task.getFile();
		String filenameString = file.getOriginalFilename();
		// String pathString = "C:\\Users\\Owner\\Documents\\internship\\Eclipse
		// project\\hstask\\WebContent\\assets\\image";
		//String pathString = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps\\upl";
		//String pathString="C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\upl";
		String pathString="cd //usr//local//tomcat9//webapps//upl";
		// String pathString =
		// session.getServletContext().getRealPath("/WEB-INF/upload11");
		File file2 = new File(pathString);
		if (!file2.exists()) {
			file2.mkdir();
		}
		System.out.println("" + pathString);
		try {

			byte barr[] = file.getBytes();
			BufferedOutputStream bout = new BufferedOutputStream(
					new FileOutputStream(new File(pathString + "/" + filenameString)));
			bout.write(barr);
			bout.flush();
			bout.close();

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public List<Student> adminlogin(UserModel user) {
		List<Student> studentlist = jdbcTemplate.query("select * from adminlogin where email='" + user.getUsername()
				+ "' and password='" + user.getPassword() + "'", new RowMapper<Student>() {

					@Override
					public Student mapRow(ResultSet rs, int arg1) throws SQLException {
						// TODO Auto-generated method stub
						Student student = new Student();
						student.setStuEmail(rs.getString("email"));
						student.setStuPassword(rs.getString("password"));

						return student;

					}

				});
		return studentlist.size() > 0 ? studentlist : null;
	}

	public List<Modaltask> admintbl() {
		return jdbcTemplate.query("select * from taskdetail where status = '0' ", new RowMapper<Modaltask>() {

			@Override
			public Modaltask mapRow(ResultSet rs, int arg1) throws SQLException {
				Modaltask modaltask = new Modaltask();
				modaltask.setId(rs.getInt(1));
				modaltask.setTask(rs.getString(2));
				modaltask.setTaskdetail(rs.getString(3));
				modaltask.setTasktime(rs.getString(4));
				modaltask.setUsername(rs.getString(5));
				modaltask.setFilename(rs.getString(6));
				return modaltask;
			}

		});
	}

	public List<Modaltask> editremark(int id) {
		return jdbcTemplate.query("select * from taskdetail where id='" + id + "'", new RowMapper<Modaltask>() {

			@Override
			public Modaltask mapRow(ResultSet rs, int arg1) throws SQLException {
				Modaltask modaltask = new Modaltask();
				modaltask.setId(rs.getInt(1));
				modaltask.setTask(rs.getString(2));
				modaltask.setTaskdetail(rs.getString(3));
				modaltask.setTasktime(rs.getString(4));
				modaltask.setUsername(rs.getString(5));
				return modaltask;
			}

		});
	}

	public int addremark(Modaltask task) {
		String sql = "insert into addremark(id,task,taskdetail,tasktime,username,remark) values('" + task.getId()
				+ "','" + task.getTask() + "','" + task.getTaskdetail() + "','" + task.getTasktime() + "','"
				+ task.getUsername() + "','" + task.getRemark() + "') ";
		return jdbcTemplate.update(sql);
	}

	public void sendemail(Modaltask task) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("hstechtask@gmail.com");
		message.setTo("lanjewarprajwal9763@gmail.com");
		message.setSubject("Hs-group Remark");
		message.setText("Your remark :" + task.getRemark());

		mailsender.send(message);

	}

	public int updatestatus(Modaltask task) {
		String sql = "update taskdetail set status = '1' where id='" + task.getId() + "'";
		return jdbcTemplate.update(sql);
	}

	public List<Modaltask> remarkby(String loginsuccess) {
		return jdbcTemplate.query("select * from addremark where username='" + loginsuccess + "'",
				new RowMapper<Modaltask>() {

					@Override
					public Modaltask mapRow(ResultSet rs, int arg1) throws SQLException {
						Modaltask modaltask = new Modaltask();
						modaltask.setId(rs.getInt(1));
						modaltask.setTask(rs.getString(2));
						modaltask.setTaskdetail(rs.getString(3));
						modaltask.setTasktime(rs.getString(4));
						modaltask.setUsername(rs.getString(5));
						modaltask.setRemark(rs.getString(6));
						return modaltask;
					}

				});

	}

	public int updateotpotpformail(Student student, int otp) {
		String sql = "update sturegister set otp='" + student.getOtp() + "' where email='" + student.getStuEmail()
				+ "' ";

		return jdbcTemplate.update(sql);
	}

	public void sendOTPtoEmail(Student student) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("hstechtask@gmail.com");
		message.setTo(student.getStuEmail());
		message.setSubject("Email Verification");
		message.setText("Your OTP is " + student.getOtp());
		mailsender.send(message);

	}

	public List<Student> newotpverify(String newotp, Student student) {
		return jdbcTemplate.query("select * from sturegister where otp='" + newotp + "'", new RowMapper<Student>() {

			@Override
			public Student mapRow(ResultSet rs, int arg1) throws SQLException {

				Student vedix = new Student();
				vedix.setStuEmail(rs.getString("email"));
				vedix.setStuPassword(rs.getString("password"));
				SimpleMailMessage message = new SimpleMailMessage();
				message.setFrom("hstechtask@gmail.com");
				message.setTo(rs.getString("email"));
				message.setSubject("Email password Verification");
				message.setText("Your password is " + rs.getString("password"));
				mailsender.send(message);
				return vedix;
			}

		});

	}

	public List<Student> change(Student student) {
		List<Student> studentlist = jdbcTemplate.query("select * from sturegister where email='" + student.getStuEmail()
				+ "' and password='" + student.getStuPassword() + "'", new RowMapper<Student>() {

					@Override
					public Student mapRow(ResultSet rs, int arg1) throws SQLException {
						// TODO Auto-generated method stub
						Student student = new Student();
						student.setStuEmail(rs.getString("email"));
						student.setStuPassword(rs.getString("password"));

						return student;

					}

				});
		return studentlist.size() > 0 ? studentlist : null;
	}

	public int updatepass(String loginsuccess, String password) {
		String sql = "update sturegister set password='" + password + "' where email='" + loginsuccess + "'  ";
		return jdbcTemplate.update(sql);
	}

	public int deleteremark(int id) {
		// TODO Auto-generated method stub
		String sql = "delete from taskdetail where id='" + id + "'";
		return jdbcTemplate.update(sql);
	}

	public void sendMailAttachment(MailModelAttachment mailattach, CommonsMultipartFile file) {

		javaMailSender.send(new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				messageHelper.setFrom("hstechtask@gmail.com");
				messageHelper.setTo(mailattach.getTo());
				messageHelper.setSubject(mailattach.getSubject());
				System.out.println("subject::"+mailattach.getSubject()+"to::"+mailattach.getTo());
				messageHelper.setText(mailattach.getMessage());

				// determines if there is an upload file, attach it to the e-mail
				String attachName = file.getOriginalFilename();
				if (!file.equals("")) {

					messageHelper.addAttachment(attachName, new InputStreamSource() {

						@Override
						public InputStream getInputStream() throws IOException {
							return file.getInputStream();
						}
					});
				}

			}
		});
	}

	public List<Student> usernametbl() {
		// TODO Auto-generated method stub
		return jdbcTemplate.query("select * from sturegister ", new RowMapper<Student>() {

			@Override
			public Student mapRow(ResultSet rs, int arg1) throws SQLException {
				Student student = new Student();
				student.setStuEmail(rs.getString("email"));
				return student;
			}

		});
	}

	public List<Student> checkemail(Student student) {
		List<Student> studentlist = jdbcTemplate.query(
				"select * from sturegister where email='" + student.getStuEmail() + "'", new RowMapper<Student>() {

					@Override
					public Student mapRow(ResultSet rs, int arg1) throws SQLException {
						// TODO Auto-generated method stub
						Student student = new Student();
						student.setStuEmail(rs.getString("email"));
						return student;

					}

				});
		return studentlist.size() > 0 ? studentlist : null;

	}

	public List<Modaltask> imgview(String username) {
		return jdbcTemplate.query("select * from taskdetail where username '" + username + "' ",
				new RowMapper<Modaltask>() {

					@Override
					public Modaltask mapRow(ResultSet rs, int arg1) throws SQLException {
						Modaltask modaltask = new Modaltask();
						modaltask.setId(rs.getInt(1));
						modaltask.setTask(rs.getString(2));
						modaltask.setTaskdetail(rs.getString(3));
						modaltask.setTasktime(rs.getString(4));
						modaltask.setUsername(rs.getString(5));
						modaltask.setFilename(rs.getString(6));
						return modaltask;
					}

				});
	}

}
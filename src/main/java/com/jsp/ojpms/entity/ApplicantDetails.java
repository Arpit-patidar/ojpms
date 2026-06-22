package com.jsp.ojpms.entity;

import javax.persistence.*;

@Entity
@Table(name = "applicant_details")
public class ApplicantDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	private int userId;
	private int jobId;

	private String fullName;
	private String email;
	private String mobile;
	private String address;

	@Column(length = 5000)
	private String skills;

	private String experience;

	private String tenthMarks;
	private String twelfthMarks;
	private String graduationMarks;

	private String collegeName;
	private String passingYear;

	private String resumeFile;
	private String certificateFile;

	@Column(length = 5000)
	private String coverLetter;

	private String status = "PENDING";

	public ApplicantDetails() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getTenthMarks() {
		return tenthMarks;
	}

	public void setTenthMarks(String tenthMarks) {
		this.tenthMarks = tenthMarks;
	}

	public String getTwelfthMarks() {
		return twelfthMarks;
	}

	public void setTwelfthMarks(String twelfthMarks) {
		this.twelfthMarks = twelfthMarks;
	}

	public String getGraduationMarks() {
		return graduationMarks;
	}

	public void setGraduationMarks(String graduationMarks) {
		this.graduationMarks = graduationMarks;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getPassingYear() {
		return passingYear;
	}

	public void setPassingYear(String passingYear) {
		this.passingYear = passingYear;
	}

	public String getResumeFile() {
		return resumeFile;
	}

	public void setResumeFile(String resumeFile) {
		this.resumeFile = resumeFile;
	}

	public String getCertificateFile() {
		return certificateFile;
	}

	public void setCertificateFile(String certificateFile) {
		this.certificateFile = certificateFile;
	}

	public String getCoverLetter() {
		return coverLetter;
	}

	public void setCoverLetter(String coverLetter) {
		this.coverLetter = coverLetter;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
package com.jsp.ojpms.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.jsp.ojpms.dao.ApplicantDetailsDao;
import com.jsp.ojpms.entity.ApplicantDetails;
import com.jsp.ojpms.util.EmailUtil;

@WebServlet("/saveApplication")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class SaveApplicationController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            ApplicantDetails app = new ApplicantDetails();

            // Basic Fields
            app.setJobId(Integer.parseInt(req.getParameter("jobId")));
            app.setFullName(req.getParameter("fullName"));
            app.setEmail(req.getParameter("email"));
            app.setMobile(req.getParameter("mobile"));
            app.setAddress(req.getParameter("address"));
            app.setSkills(req.getParameter("skills"));
            app.setExperience(req.getParameter("experience"));
            app.setTenthMarks(req.getParameter("tenth"));
            app.setTwelfthMarks(req.getParameter("twelfth"));
            app.setGraduationMarks(req.getParameter("graduation"));
            app.setCollegeName(req.getParameter("college"));
            app.setPassingYear(req.getParameter("passingYear"));
            app.setCoverLetter(req.getParameter("coverLetter"));

            // Resume Upload
            Part resumePart = req.getPart("resume");
            String resumePath = uploadFile(resumePart, "resume");
            app.setResumeFile(resumePath);

            // Certificate Upload
            Part certificatePart = req.getPart("certificate");

            if (certificatePart != null
                    && certificatePart.getSize() > 0
                    && certificatePart.getSubmittedFileName() != null
                    && !certificatePart.getSubmittedFileName().isEmpty()) {

                String certificatePath = uploadFile(certificatePart, "certificate");
                app.setCertificateFile(certificatePath);
            }

            // Save Candidate Details
            ApplicantDetailsDao.save(app);

            System.out.println("Applicant Saved Successfully");

            // Send Confirmation Email
            EmailUtil.sendEmail(
                    app.getEmail(),
                    "Application Submitted Successfully",
                    "Dear " + app.getFullName()
                            + ",\n\nYour application has been submitted successfully."
                            + "\n\nJob ID : " + app.getJobId()
                            + "\n\nThank You for applying."
                            + "\n\nTeam OJPMS");

            System.out.println("Email Sent Successfully");

            resp.setContentType("text/html");
            resp.getWriter().println(
                    "<h2 style='color:green;text-align:center;'>Application Submitted Successfully!</h2>");

        } catch (Exception e) {

            e.printStackTrace();

            resp.setContentType("text/html");
            resp.getWriter().println(
                    "<h2 style='color:red;text-align:center;'>Error While Submitting Application!</h2>");
        }
    }

    private String uploadFile(Part part, String folder) throws IOException {

        String uploadPath = "D:/ojpms_uploads/" + folder;

        File dir = new File(uploadPath);

        if (!dir.exists()) {
            dir.mkdirs();
        }

        String fileName = System.currentTimeMillis()
                + "_"
                + part.getSubmittedFileName();

        part.write(uploadPath + File.separator + fileName);

        return uploadPath + "/" + fileName;
    }
}
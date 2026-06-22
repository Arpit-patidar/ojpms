package com.jsp.ojpms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.ojpms.dao.ApplicantDetailsDao;
import com.jsp.ojpms.entity.ApplicantDetails;
import com.jsp.ojpms.util.EmailUtil;

@WebServlet("/updateStatus")
public class UpdateStatusController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(req.getParameter("id"));
            String status = req.getParameter("status");

            // Update Status
            ApplicantDetailsDao.updateStatus(id, status);

            // Get Applicant Details
            ApplicantDetails applicant =
                    ApplicantDetailsDao.getById(id);

            if (applicant != null) {

                String subject = "Application Status Update";
                String message = "";

                if ("APPROVED".equalsIgnoreCase(status)) {

                    message =
                            "Dear " + applicant.getFullName()
                            + ",\n\nCongratulations! 🎉"
                            + "\n\nYour application has been APPROVED."
                            + "\n\nOur team will contact you soon."
                            + "\n\nRegards,"
                            + "\nOJPMS Team";

                } else if ("REJECTED".equalsIgnoreCase(status)) {

                    message =
                            "Dear " + applicant.getFullName()
                            + ",\n\nThank you for applying."
                            + "\n\nWe regret to inform you that your application has been REJECTED."
                            + "\n\nWe wish you success in your future opportunities."
                            + "\n\nRegards,"
                            + "\nOJPMS Team";
                }

                System.out.println("Sending Email To : "
                        + applicant.getEmail());

                EmailUtil.sendEmail(
                        applicant.getEmail(),
                        subject,
                        message
                );

                System.out.println("Email Sent Successfully");
            }

            resp.sendRedirect("viewApplicants");

        } catch (Exception e) {

            e.printStackTrace();

            resp.getWriter().println(
                    "Error While Updating Status");
        }
    }
}
package com.test.service;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/GoodsServlet")
public class GoodsServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		//
		String price1=request.getParameter("goodsPrice");
		
	

		String goodsName="", goodsType="";
		double goodsPrice=0;

		// 
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// 
		ServletContext servletContext = this.getServletConfig()
				.getServletContext();
		File repository = (File) servletContext
				.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// ServletFileUpload 
		ServletFileUpload upload = new ServletFileUpload(factory);
		// request
		try {
			List<FileItem> items = upload.parseRequest(request);

			// List
			// Process the uploaded items
			Iterator<FileItem> iter = items.iterator();
			while (iter.hasNext()) {
				// FileItem
				// 
				FileItem item = iter.next();

				// isFormField()
				if (item.isFormField()) {

					String name = item.getFieldName();
					// ʵitem.getString
					// item.getString(arg0) ==>
					String value = item.getString("utf-8");

					System.out.println(" isFormField name :" + name + ",value"
							+ value);

					// goodsNameƥ  name
					if (name.equals("goodsName")) {
						goodsName = value;
					} else if (name.equals("goodsType")) {
						goodsType = value;
					}
					//request.getParameter
					String price2=request.getParameter("goodsPrice");

					System.out.println(": "+goodsName+","+goodsType+","+price1+","+price2);
				} else {
					// 
					String fieldName = item.getFieldName();
					String fileName = item.getName(); // 
					String contentType = item.getContentType();
					boolean isInMemory = item.isInMemory();
					long sizeInBytes = item.getSize(); //

					// path
					String path = request.getRealPath("/imgs/" + fileName);
					System.out.println("path :" + path);
					
					File uploadedFile = new File(path);
					
					item.write(uploadedFile);
				}
			}

		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

package com.test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
@WebFilter(filterName="charFilter",urlPatterns={"/*"},initParams={
@WebInitParam(name="encoding",value="UTF-8")})
public class MyFilter implements Filter{
	public String encoding;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest hrequest=(HttpServletRequest)arg0;
		arg0.setCharacterEncoding(encoding);
		arg2.doFilter(arg0, arg1);	
			}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//String usernmeString=filterConfig.getInitParameter("username");
		encoding=filterConfig.getInitParameter("encoding");
	}

}

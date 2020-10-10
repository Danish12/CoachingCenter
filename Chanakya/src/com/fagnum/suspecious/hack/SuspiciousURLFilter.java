/*package com.fagnum.suspecious.hack;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fagnum.services.model.AccessDetails;
import com.fagnum.services.service.AccessDetailsService;

public class SuspiciousURLFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
		
		String uri = null;
		boolean doReject = false;
		int count = 0;
		if(request instanceof HttpServletRequest){
			uri = ((HttpServletRequest ) request).getRequestURI().toString();
		}
		// Delay the response back
		String ip = request.getRemoteAddr();
		// if the hits are greater than the amount then delay the request and
		// reject it too
		AccessDetails accessDetails = new AccessDetails();
		accessDetails.setAccessedOn(new Date());
		accessDetails.setIp(ip);
		accessDetails.setUrl(uri);
		AccessDetailsService accessDetailsService = com.fagnum.controller.AppController.getAccessDetailsService();
		
		try {
			
			List<Object> parameterList = new ArrayList<Object>();
			parameterList.add(accessDetails.getAccessedOn());
			parameterList.add(accessDetails.getIp());
			parameterList.add(accessDetails.getUrl());
			String query = new String("from AccessDetails where accessedOn = ? and ip = ? and url = ?");
			List<AccessDetails> accessDetailsList = accessDetailsService.getDynamicList(parameterList, query);
			
			if(accessDetailsList.isEmpty()) {
				accessDetails.setCount(1);
				accessDetails.setStatus("Live");
				accessDetailsService.save(accessDetails);
			}else {
				for (AccessDetails accessDetails2 : accessDetailsList) {
					accessDetails = accessDetails2;
					count = accessDetails2.getCount();
				}
				if(count < 8) {
					count = count +1;
					accessDetails.setCount(count);
					accessDetailsService.update(accessDetails);
				} else {
					count = count +1;
					accessDetails.setCount(count);
					accessDetails.setStatus("Blocked");
					accessDetailsService.update(accessDetails);
					doReject = true;
				}
			}
			
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		if (doReject) {
			try {
				Thread.sleep(1000);
				HttpServletResponse httpResponse = (HttpServletResponse) response;
				// send error or maybe redirect to some error page
				//httpResponse.sendError(HttpServletResponse.SC_BAD_REQUEST);
				ResourceBundle resource = ResourceBundle.getBundle("application");
				httpResponse.sendRedirect(resource.getString("siteUrl")+"blocked.jsp");
				
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

		} else {
			filterChain.doFilter(request, response);
		}
		filterChain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
	}
}*/
/*
 * Copyright (c) 2005 Authentisoft, LLC. All Rights Reserved.
 */
package com.atlassian.crowd.security.demo.action;

import com.atlassian.crowd.integration.http.filter.CrowdSecurityFilter;
import org.apache.struts2.ServletActionContext;

public class Login extends BaseAction
{
    private String username;
    private String password;

    public String execute()
    {
        try
        {
            if (username != null && !username.equals("") && password != null)
            {
                crowdHttpAuthenticator.authenticate(ServletActionContext.getRequest(), ServletActionContext.getResponse(), username, password);

                String requestingPage = (String) getSession().getAttribute(CrowdSecurityFilter.ORIGINAL_URL);

                if (requestingPage != null)
                {
                    ServletActionContext.getResponse().sendRedirect(requestingPage);

                    return NONE;

                }
                else
                {
                    return SUCCESS;
                }

            }
            else
            {
                // didn't supply authentication information, check if already authenticated
                if (isAuthenticated())
                {
                    return SUCCESS;
                }
            }

        }
        catch (Exception e)
        {
            addActionError(getText("invalidlogin.label"));

            logger.info(e.getMessage(), e);

        }

        return INPUT;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }
}

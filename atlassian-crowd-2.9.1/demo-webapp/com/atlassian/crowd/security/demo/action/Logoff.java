/*
 * Copyright (c) 2005 Authentisoft, LLC. All Rights Reserved.
 */
package com.atlassian.crowd.security.demo.action;

import org.apache.struts2.ServletActionContext;

public class Logoff extends BaseAction
{

    public String execute() throws Exception
    {
        crowdHttpAuthenticator.logout(ServletActionContext.getRequest(), ServletActionContext.getResponse());

        getSession().invalidate();

        return SUCCESS;
    }
}

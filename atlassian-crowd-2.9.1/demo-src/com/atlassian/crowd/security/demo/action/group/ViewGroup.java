/*
 * Copyright (c) 2005 Authentisoft, LLC. All Rights Reserved.
 */
package com.atlassian.crowd.security.demo.action.group;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.atlassian.crowd.model.group.Group;
import com.atlassian.crowd.security.demo.action.BaseAction;

public class ViewGroup extends BaseAction
{
    private static final Logger logger = LoggerFactory.getLogger(ViewGroup.class);

    private Group group;

    private String name;
    private String groupDescription;
    private boolean active;

    public String doDefault()
    {
        try
        {
            group = crowdClient.getGroup(name);

            this.groupDescription = group.getDescription();
            this.active = group.isActive();

        }
        catch (Exception e)
        {
            addActionError(e.getMessage());
            logger.debug(e.getMessage(), e);
        }

        return SUCCESS;
    }

    public Group getGroup()
    {
        return group;
    }

    public String getGroupDescription()
    {
        return groupDescription;
    }

    public void setGroupDescription(String groupDescription)
    {
        this.groupDescription = groupDescription;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public boolean isActive()
    {
        return active;
    }

    public void setActive(boolean active)
    {
        this.active = active;
    }
}
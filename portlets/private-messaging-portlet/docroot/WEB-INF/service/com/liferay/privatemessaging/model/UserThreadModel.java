/**
 * Copyright (c) 2000-2010 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.privatemessaging.model;

import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.BaseModel;
import com.liferay.portal.service.ServiceContext;

import com.liferay.portlet.expando.model.ExpandoBridge;

import java.io.Serializable;

import java.util.Date;

/**
 * The base model interface for the UserThread service. Represents a row in the &quot;PM_UserThread&quot; database table, with each column mapped to a property of this class.
 *
 * <p>
 * This interface and its corresponding implementation {@link com.liferay.privatemessaging.model.impl.UserThreadModelImpl} exist only as a container for the default property accessors generated by ServiceBuilder. Helper methods and all application logic should be put in {@link com.liferay.privatemessaging.model.impl.UserThreadImpl}.
 * </p>
 *
 * <p>
 * Never modify or reference this interface directly. All methods that expect a user thread model instance should use the {@link UserThread} interface instead.
 * </p>
 *
 * @author Brian Wing Shun Chan
 * @see UserThread
 * @see com.liferay.privatemessaging.model.impl.UserThreadImpl
 * @see com.liferay.privatemessaging.model.impl.UserThreadModelImpl
 * @generated
 */
public interface UserThreadModel extends BaseModel<UserThread> {
	/**
	 * Gets the primary key of this user thread.
	 *
	 * @return the primary key of this user thread
	 */
	public long getPrimaryKey();

	/**
	 * Sets the primary key of this user thread
	 *
	 * @param pk the primary key of this user thread
	 */
	public void setPrimaryKey(long pk);

	/**
	 * Gets the user thread id of this user thread.
	 *
	 * @return the user thread id of this user thread
	 */
	public long getUserThreadId();

	/**
	 * Sets the user thread id of this user thread.
	 *
	 * @param userThreadId the user thread id of this user thread
	 */
	public void setUserThreadId(long userThreadId);

	/**
	 * Gets the company id of this user thread.
	 *
	 * @return the company id of this user thread
	 */
	public long getCompanyId();

	/**
	 * Sets the company id of this user thread.
	 *
	 * @param companyId the company id of this user thread
	 */
	public void setCompanyId(long companyId);

	/**
	 * Gets the user id of this user thread.
	 *
	 * @return the user id of this user thread
	 */
	public long getUserId();

	/**
	 * Sets the user id of this user thread.
	 *
	 * @param userId the user id of this user thread
	 */
	public void setUserId(long userId);

	/**
	 * Gets the user uuid of this user thread.
	 *
	 * @return the user uuid of this user thread
	 * @throws SystemException if a system exception occurred
	 */
	public String getUserUuid() throws SystemException;

	/**
	 * Sets the user uuid of this user thread.
	 *
	 * @param userUuid the user uuid of this user thread
	 */
	public void setUserUuid(String userUuid);

	/**
	 * Gets the create date of this user thread.
	 *
	 * @return the create date of this user thread
	 */
	public Date getCreateDate();

	/**
	 * Sets the create date of this user thread.
	 *
	 * @param createDate the create date of this user thread
	 */
	public void setCreateDate(Date createDate);

	/**
	 * Gets the modified date of this user thread.
	 *
	 * @return the modified date of this user thread
	 */
	public Date getModifiedDate();

	/**
	 * Sets the modified date of this user thread.
	 *
	 * @param modifiedDate the modified date of this user thread
	 */
	public void setModifiedDate(Date modifiedDate);

	/**
	 * Gets the mb thread id of this user thread.
	 *
	 * @return the mb thread id of this user thread
	 */
	public long getMbThreadId();

	/**
	 * Sets the mb thread id of this user thread.
	 *
	 * @param mbThreadId the mb thread id of this user thread
	 */
	public void setMbThreadId(long mbThreadId);

	/**
	 * Gets the top m b message id of this user thread.
	 *
	 * @return the top m b message id of this user thread
	 */
	public long getTopMBMessageId();

	/**
	 * Sets the top m b message id of this user thread.
	 *
	 * @param topMBMessageId the top m b message id of this user thread
	 */
	public void setTopMBMessageId(long topMBMessageId);

	/**
	 * Gets the read of this user thread.
	 *
	 * @return the read of this user thread
	 */
	public boolean getRead();

	/**
	 * Determines whether this user thread is read.
	 *
	 * @return whether this user thread is read
	 */
	public boolean isRead();

	/**
	 * Sets whether this {$entity.humanName} is read.
	 *
	 * @param read the read of this user thread
	 */
	public void setRead(boolean read);

	/**
	 * Gets the deleted of this user thread.
	 *
	 * @return the deleted of this user thread
	 */
	public boolean getDeleted();

	/**
	 * Determines whether this user thread is deleted.
	 *
	 * @return whether this user thread is deleted
	 */
	public boolean isDeleted();

	/**
	 * Sets whether this {$entity.humanName} is deleted.
	 *
	 * @param deleted the deleted of this user thread
	 */
	public void setDeleted(boolean deleted);

	/**
	 * Gets a copy of this user thread as an escaped model instance by wrapping it with an {@link com.liferay.portal.kernel.bean.AutoEscapeBeanHandler}.
	 *
	 * @return the escaped model instance
	 * @see com.liferay.portal.kernel.bean.AutoEscapeBeanHandler
	 */
	public UserThread toEscapedModel();

	public boolean isNew();

	public void setNew(boolean n);

	public boolean isCachedModel();

	public void setCachedModel(boolean cachedModel);

	public boolean isEscapedModel();

	public void setEscapedModel(boolean escapedModel);

	public Serializable getPrimaryKeyObj();

	public ExpandoBridge getExpandoBridge();

	public void setExpandoBridgeAttributes(ServiceContext serviceContext);

	public Object clone();

	public int compareTo(UserThread userThread);

	public int hashCode();

	public String toString();

	public String toXmlString();
}
package com.hlzn.HRS.entities;

/**
 * Notice entity. @author MyEclipse Persistence Tools
 */

public class Notice implements java.io.Serializable
{

	// Fields

	private Integer noticeId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeSavetime;

	// Constructors

	/** default constructor */
	public Notice()
	{
	}

	/** minimal constructor */
	public Notice(Integer noticeId)
	{
		this.noticeId = noticeId;
	}

	/** full constructor */
	public Notice(Integer noticeId, String noticeTitle, String noticeContent,
			String noticeSavetime)
	{
		this.noticeId = noticeId;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeSavetime = noticeSavetime;
	}

	// Property accessors

	public Integer getNoticeId()
	{
		return this.noticeId;
	}

	public void setNoticeId(Integer noticeId)
	{
		this.noticeId = noticeId;
	}

	public String getNoticeTitle()
	{
		return this.noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle)
	{
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent()
	{
		return this.noticeContent;
	}

	public void setNoticeContent(String noticeContent)
	{
		this.noticeContent = noticeContent;
	}

	public String getNoticeSavetime()
	{
		return this.noticeSavetime;
	}

	public void setNoticeSavetime(String noticeSavetime)
	{
		this.noticeSavetime = noticeSavetime;
	}

}
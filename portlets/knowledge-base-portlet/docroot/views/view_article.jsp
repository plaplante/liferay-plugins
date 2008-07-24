<%
/**
 * Copyright (c) 2000-2008 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>
<%@ include file="/init.jsp" %>

<%
KBArticle article = (KBArticle)request.getAttribute(KnowledgeBaseKeys.ARTICLE);

String title = article.getTitle();

String[] attachments = new String[0];

if (article != null) {
	attachments = article.getAttachmentsFiles();
}

boolean print = ParamUtil.getBoolean(request, Constants.PRINT);

TagsAssetLocalServiceUtil.incrementViewCounter(KBArticle.class.getName(), article.getResourcePrimKey());

PortletURL viewAllURL = renderResponse.createRenderURL();

PortletURL viewArticleURL = renderResponse.createRenderURL();

viewArticleURL.setParameter("view", "view_article");
viewArticleURL.setParameter("title", title);

PortletURL addArticleURL = renderResponse.createRenderURL();

addArticleURL.setParameter("view", "edit_article");
addArticleURL.setParameter("redirect", currentURL);
addArticleURL.setParameter("editTitle", "1");

if (article != null) {
	addArticleURL.setParameter("parentTitle", article.getTitle());
}

List childArticles = article.getChildArticles();

PortletURL editArticleURL = renderResponse.createRenderURL();

editArticleURL.setParameter("view", "edit_article");
editArticleURL.setParameter("redirect", currentURL);
editArticleURL.setParameter("title", title);

PortletURL printArticleURL = renderResponse.createRenderURL();

printArticleURL.setParameter("view", "view_article");
printArticleURL.setParameter("title", title);
printArticleURL.setWindowState(LiferayWindowState.POP_UP);

printArticleURL.setParameter("print", "true");

PortletURL taggedArticlesURL = renderResponse.createRenderURL();

taggedArticlesURL.setParameter("view", "view_tagged_articles");

PortletURL viewAttachmentsURL = renderResponse.createRenderURL();

viewAttachmentsURL.setParameter("view", "view_article_attachments");
viewAttachmentsURL.setParameter("title", title);
%>

<c:choose>
	<c:when test="<%= print %>">
		<script type="text/javascript">
			print();
		</script>

		<div class="popup-print">
			<liferay-ui:icon image="print" message="print" url="javascript: print();" />
		</div>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			function <portlet:namespace />printArticle() {
				window.open('<%= printArticleURL %>', '', "directories=0,height=480,left=80,location=1,menubar=1,resizable=1,scrollbars=yes,status=0,toolbar=0,top=180,width=640");
			}
		</script>
	</c:otherwise>
</c:choose>

<c:if test="<%= Validator.isNotNull(article.getParentTitle()) %>">
	<div class="breadcrumbs">

		<%
		PortletURL viewParentArticleURL = renderResponse.createRenderURL();

		viewParentArticleURL.setParameter("view", "view_article");

		List parentArticles = article.getParentArticles();

		for (int i = 0; i < parentArticles.size(); i++) {
			KBArticle curParentArticle = (KBArticle)parentArticles.get(i);

			viewParentArticleURL.setParameter("title", curParentArticle.getTitle());
		%>

			<a href="<%= viewParentArticleURL %>"><%= curParentArticle.getTitle() %></a>

			<c:if test="<%= i < parentArticles.size() %>">
				&raquo;
			</c:if>

		<%
		}
		%>

	</div>
</c:if>

<h1 class="article-title">
	<%= title %>
</h1>

<div class="float-container">
	<c:if test="<%= !print %>">
		<div class="side-boxes">
			<div class="side-box">
				<div class="side-box-title"><liferay-ui:message key="details" /></div>
				<div class="side-box-content">
					<ul class="lfr-component">
						<li>
							<b><liferay-ui:message key="id" /></b>: <%= article.getResourcePrimKey() %>
						</li>
						<li>
							<b><liferay-ui:message key="version" /></b>: <%= article.getVersion() %>
						</li>
						<li>
							<b><liferay-ui:message key="updated" /></b>: <%= dateFormatDateTime.format(article.getModifiedDate()) %>
						</li>
						<li>
							<b><liferay-ui:message key="by" /></b>: <%= PortalUtil.getUserName(article.getUserId(), article.getUserName()) %>
						</li>
						<li>
							<b><liferay-ui:message key="views" /></b>:
							<%
							TagsAsset asset = TagsAssetLocalServiceUtil.getAsset(KBArticle.class.getName(), article.getResourcePrimKey());
							%>
							<%= asset.getViewCount() %>
						</li>
						<li>
							<liferay-ui:tags-summary
								className="<%= KBArticle.class.getName() %>"
								classPK="<%= article.getResourcePrimKey() %>"
								portletURL="<%= taggedArticlesURL %>"
							/>
						</li>

				</div>
			</div>
			<div class="side-box">
				<div class="side-box-title"><liferay-ui:message key="attachments" /></div>
				<div class="side-box-content">
					<liferay-ui:icon image="clip" message='<%= attachments.length + " " + LanguageUtil.get(pageContext, "attachments") %>' url="<%= viewAttachmentsURL.toString() %>" method="get" label="<%= true %>" />
				</div>
			</div>
			<div class="side-box">
				<div class="side-box-title"><liferay-ui:message key="actions" /></div>
				<div class="side-box-content">
					<liferay-ui:icon-list>
						<c:if test="<%= KBArticlePermission.contains(permissionChecker, article, ActionKeys.UPDATE) %>">
							<liferay-ui:icon image="edit" label="<%= true %>" url="<%= editArticleURL.toString() %>" />
						</c:if>

						<liferay-ui:icon image="print" label="<%= true %>" message="print" url='<%= "javascript: " + renderResponse.getNamespace() + "printArticle();" %>' />

						<%
						String[] extensions = prefs.getValues("extensions", new String[] {"pdf"});

						for (String extension : extensions) {
							ResourceURL convertURL = renderResponse.createResourceURL();

							convertURL.setParameter("actionName", "convert");
							convertURL.setParameter("title", article.getTitle());
							convertURL.setParameter("version", String.valueOf(article.getVersion()));
							convertURL.setParameter("targetExtension", extension);
						%>

							<liferay-ui:icon
								image='<%= "../document_library/" + extension %>'
								message="<%= extension.toUpperCase() %>"
								url='<%= convertURL.toString() %>'
							/>

						<%
						}
						%>

						<c:if test="<%= KBArticlePermission.contains(permissionChecker, article, ActionKeys.SUBSCRIBE) %>">
							<c:choose>
								<c:when test="<%= SubscriptionLocalServiceUtil.isSubscribed(user.getCompanyId(), user.getUserId(), KBArticle.class.getName(), article.getResourcePrimKey()) %>">
									<portlet:actionURL var="unsubscribeURL">
										<portlet:param name="actionName" value="unsubscribeArticle" />
										<portlet:param name="redirect" value="<%= currentURL %>" />
										<portlet:param name="title" value="<%= String.valueOf(article.getTitle()) %>" />
									</portlet:actionURL>

									<liferay-ui:icon image="unsubscribe" url="<%= unsubscribeURL %>" label="<%= true %>" />
								</c:when>
								<c:otherwise>
									<portlet:actionURL var="subscribeURL">
										<portlet:param name="actionName" value="subscribeArticle" />
										<portlet:param name="redirect" value="<%= currentURL %>" />
										<portlet:param name="title" value="<%= String.valueOf(article.getTitle()) %>" />
									</portlet:actionURL>

									<liferay-ui:icon image="subscribe" url="<%= subscribeURL %>" label="<%= true %>" />
								</c:otherwise>
							</c:choose>
						</c:if>

						<c:if test="<%= KBArticlePermission.contains(permissionChecker, article, ActionKeys.DELETE) %>">
							<%
							PortletURL deleteArticleURL = renderResponse.createActionURL();

							deleteArticleURL.setParameter("actionName", Constants.DELETE);
							deleteArticleURL.setParameter("title", article.getTitle());
							deleteArticleURL.setParameter("redirect", viewAllURL.toString());
							%>

							<liferay-ui:icon-delete url="<%= deleteArticleURL.toString() %>" label="<%= true %>" />
						</c:if>
					</liferay-ui:icon-list>
				</div>
			</div>
		</div>
	</c:if>

	<div class="knowledge-base-body">
		<%= article.getContent() %>
	</div>
</div>

<c:if test="<%= (childArticles.size() > 0) %>">
	<div class="separator"><!-- --></div>
</c:if>

<c:if test="<%= childArticles.size() > 0 %>">
	<div class="child-articles">
		<h3><liferay-ui:message key="children" /></h3>

		<ul class="child-articles">

			<%
			PortletURL curArticleURL = renderResponse.createRenderURL();
			curArticleURL.setParameter("view", "view_article");

			for (int i = 0; i < childArticles.size(); i++) {
				KBArticle curArticle = (KBArticle)childArticles.get(i);

				curArticleURL.setParameter("title", curArticle.getTitle());
			%>

				<li>
					<a href="<%= curArticleURL %>"><%= curArticle.getTitle() %></a>
				</li>

			<%
			}
			%>

		</ul>
	</div>
</c:if>

<c:if test="<%= KBArticlePermission.contains(permissionChecker, article, KnowledgeBaseKeys.ADD_CHILD_ARTICLE) && !print %>">
	<div class="article-actions">
		<liferay-ui:icon image="add_article" message="add-child-article" url="<%= addArticleURL.toString() %>" label="<%= true %>" />
	</div>
</c:if>
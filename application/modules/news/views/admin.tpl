{TinyMCE()}
<section class="box big" id="news_articles">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_text_document.png"/>
		Articles (<div style="display:inline;" id="article_count">{if !$news}0{else}{count($news)}{/if}</div>)
	</h2>

	{if hasPermission("canAddArticle")}
		<span>
			<a class="nice_button" href="javascript:void(0)" onClick="News.show()">Create article</a>
		</span>
	{/if}

	<ul id="news_list">
		{if $news}
		{foreach from=$news item=article}
			<li>
				<table width="100%">
					<tr>
						<td width="50%"><b>{$article.headline}</b></td>
						<td width="20%">{$article.nickname}</td>
						<td width="20%">{date("Y/m/d", $article.timestamp)}</td>
						<td style="text-align:right;">
							{if hasPermission("canEditArticle")}
							<a href="{$url}news/admin/edit/{$article.id}" data-tip="Edit"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;
							{/if}

							{if hasPermission("canRemoveArticle")}
							<a href="javascript:void(0)" onClick="News.remove({$article.id}, this)" data-tip="Delete"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
							{/if}
						</td>
					</tr>
				</table>
			</li>
		{/foreach}
		{/if}
	</ul>
</section>

<div id="add_news" style="display:none;">
	<section class="box big">
		<h2><a href='javascript:void(0)' onClick="News.show()" data-tip="Return to articles">Articles</a> &rarr; New article</h2>

		<form onSubmit="News.send(); return false">
			<label for="headline">Headline</label>
			<input type="hidden" id="headline" />

			<label for="news_content">Content</label>
			<input type="hidden" id="news_content" data-type="textarea"/>
		</form>
		<form onSubmit="News.send(); return false">
			<label>Article settings</label>

			<input type="checkbox" id="avatar" checked="yes" value="1"/>
			<label for="avatar" class="inline_label">Show your avatar</label>

			<input type="submit" value="Submit article" />
		</form>
	</section>
</div>

<script>
	require([Config.URL + "application/themes/admin/js/mli.js"], function()
	{
        new MultiLanguageInput($("#headline"));
        new MultiLanguageInput($("#news_content"));
	});
</script>
class PostMailer < ActionMailer::Base
  default from: "noreply.sojin.portal@gmail.com"

  def post_email(user, article)
   @title = article.title
   @abstract = article.abstract
   @user = user 
   @article = article
   if user.subemail.nil?
    mail(:to => user.email,
         :subject => "[新着記事]Sojin Portal") 
   else
     case     
      when   user.subemail.inform == 1
       mail(:to => user.email,
         :subject => "[新着記事]Sojin Portal")
      when   user.subemail.inform == 2
       mail(:to => user.subemail.sub_email,
         :subject => "[新着記事]Sojin Portal") 
      when   user.subemail.inform == 3
     end
   end
  end


  def bbs_post_email(posted_user, user, micropost)
   @user = user
   @title = micropost.title
   @content = micropost.content
   @posted_user = posted_user
   @micropost = micropost
   if user.subemail.nil?
    mail(:to => user.email,
         :subject => "[新着記事]Sojin Portal")
   else
     case
      when   user.subemail.inform == 1
       mail(:to => user.email,
         :subject => "[新着記事]Sojin Portal")
      when   user.subemail.inform == 2
       mail(:to => user.subemail.sub_email,
         :subject => "[新着記事]Sojin Portal")
      when   user.subemail.inform == 3
     end
   end
  end

  def contact_post_email(user, contact)
   @name = contact.name
   @content = contact.content
   if user == '非ログインユーザー'
    @user_name = user
   else
    @user_name = user.name
    @id = user.id
    @email = user.email
   end
   mail(:to => 'hide-0726@ezweb.ne.jp',
         :subject => "[新着報告]Sojin Portal")
  end

end


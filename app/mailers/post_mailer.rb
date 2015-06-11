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




end


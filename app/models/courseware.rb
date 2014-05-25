class Courseware < ActiveRecord::Base
  has_attached_file :ppt
  validates_attachment_presence :ppt 
  validates_attachment_content_type :ppt, :content_type => ['application/pdf',
                                              'application/vnd.ms-powerpoint',
                                              'application/vnd.openxmlformats-officedocument.presentationml.presentation',
                                              "application/vnd.ms-excel",     
                                              "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                              "application/msword", 
                                              "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
                                              "text/plain"],
                                    :message => ', Only PDF, PPT, Word, Excel, TXT files are allowed. '
  
end

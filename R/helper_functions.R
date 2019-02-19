
#' Set whether the output of the rendered R Markdown report should be attached to the email sent
#'
#' @param include_report if TRUE, will include the output of the report.
#' @examples
#' attach_report(TRUE) # Default is true will return the output of the report
#' attach_report(FALSE) # Will not include the output of the report
#' @export
attach_report <- function(include_report = TRUE) {
  rmarkdown::output_metadata$set(rsc_email_suppress_report_attachment = !include_report)
}

#' Configure the metadata associated with the email being sent.
#'
#' @param emails_subject String, if set, will override the default subject from Connect
#' @param email_body_text String, if set, will override the plain text format of the email sent from Connect
#' @param email_body_html String, if set, will set the html body used in the email from Connect. @seealso blastula::compose_email
#' @param email_images base64 encoded image (or list of images).  It is easiest to compose these anoutput of the email$images from @seealso blastula::compose_email
#' @example
#' set_email_metadatta("This is my subject line", "Here is a plain text body", "<h1> HTML doc </h1> <br> for email", email_images )
#'
#' @export
set_email_metadata <- function(email_subject = NULL,
                               email_body_text = NULL,
                               email_body_html = NULL,
                               email_images = NULL) {
  ## I probably should have a nice little function that does this for me
  if (!is.null(email_subject)) {
    rmarkdown::output_metadata$set(rsc_email_subject = email_subject)
  }
  if (!is.null(email_body_text)) {
    rmarkdown::output_metadata$set(rsc_email_body_text = email_body_text)
  }

  if (!is.null(email_body_html)) {
    rmarkdown::output_metadata$set(rsc_email_body_html = email_body_html)
  }

  if (!is.null(email_images)) {
    rmarkdown::output_metadata$set(rsc_email_images = email_images)
  }
}

#' Returns the URL for this specific rendered version of the report.
#' @export
get_report_rendering_url <- function() {
  Sys.getenv("RSC_REPORT_RENDERING_URL",
             "https://www.rstudio.com/")
}

#' Returns the URL for the latest version of the report
#' @export
get_report_url <- function() {
  Sys.getenv("RSC_REPORT_URL",
             "https://www.rstudio.com/products/connect/")
}

#' Returns the report name
#' @export
get_report_name <- function() {
  Sys.getenv("RSC_REPORT_NAME",
             "Default Report Name")
}


#' Set the output files, and/or the email attachments created by this R Markdown report
#'
#' @param output_files list of file paths of content that was created by the report
#' @param email_attachments list of file paths to the attachments created by the report
#' @export
set_email_attachments <- function(output_files = NULL,
                                  email_attachments = NULL) {
  if (!is.null(output_files)) {
    rmarkdown::output_metadata$set(rsc_output_files = output_files)
  }

  if (!is.null(email_attachments)) {
    rmarkdown::output_metadata$set(rsc_email_attachments = email_attachments)
  }

}


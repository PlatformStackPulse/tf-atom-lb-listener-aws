variable "load_balancer_arn" {
  description = "ARN of the load balancer"
  type        = string
  validation {
    condition     = length(var.load_balancer_arn) > 0
    error_message = "load_balancer_arn must not be empty."
  }
}

variable "port" {
  description = "Listener port"
  type        = number
  default     = 443
}

variable "protocol" {
  description = "Listener protocol (HTTP, HTTPS, TCP, TLS)"
  type        = string
  default     = "HTTPS"
}

variable "ssl_policy" {
  description = "SSL policy for HTTPS/TLS listeners"
  type        = string
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

variable "certificate_arn" {
  description = "ACM certificate ARN for HTTPS/TLS"
  type        = string
  default     = null
}

variable "default_action_type" {
  description = "Default action type (forward, redirect, fixed-response)"
  type        = string
  default     = "forward"
  validation {
    condition     = contains(["forward", "redirect", "fixed-response"], var.default_action_type)
    error_message = "default_action_type must be forward, redirect, or fixed-response."
  }
}

variable "target_group_arn" {
  description = "ARN of the target group (for forward action)"
  type        = string
  default     = null
}

variable "redirect_port" {
  description = "Redirect port"
  type        = string
  default     = "443"
}

variable "redirect_protocol" {
  description = "Redirect protocol"
  type        = string
  default     = "HTTPS"
}

variable "redirect_status_code" {
  description = "Redirect status code (HTTP_301 or HTTP_302)"
  type        = string
  default     = "HTTP_301"
}

variable "fixed_response_content_type" {
  description = "Content type for fixed response"
  type        = string
  default     = "text/plain"
}

variable "fixed_response_message_body" {
  description = "Message body for fixed response"
  type        = string
  default     = "Not Found"
}

variable "fixed_response_status_code" {
  description = "Status code for fixed response"
  type        = string
  default     = "404"
}

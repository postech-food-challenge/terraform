resource "aws_apigatewayv2_api" "my_api" {
  name          = "food-challenge-eks-integration"
  protocol_type = "HTTP"
  description   = "API Gateway to route requests to EKS service"
}

resource "aws_apigatewayv2_integration" "my_integration" {
  api_id             = aws_apigatewayv2_api.my_api.id
  integration_type   = "HTTP_PROXY"
  integration_uri    = "http://a48790ae2b99742948f64171ae62a202-1401423194.us-east-1.elb.amazonaws.com"
  integration_method = "ANY"
}

resource "aws_apigatewayv2_route" "default_route" {
  api_id    = aws_apigatewayv2_api.my_api.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.my_integration.id}"
}

resource "aws_apigatewayv2_route" "orders_checkout_route" {
  api_id        = aws_apigatewayv2_api.my_api.id
  route_key     = "POST /v1/orders/checkout"
  target        = "integrations/${aws_apigatewayv2_integration.my_integration.id}"
  authorizer_id = aws_apigatewayv2_authorizer.cognito_authorizer.id
}

resource "aws_apigatewayv2_authorizer" "cognito_authorizer" {
  api_id           = aws_apigatewayv2_api.my_api.id
  authorizer_type  = "JWT"
  name             = "CognitoAuthorizer"
  identity_sources = ["$request.header.Authorization"]

  jwt_configuration {
    audience = ["1p39740rbmbbbe7tdb9pf7btva"]
    issuer   = "https://cognito-idp.us-east-1.amazonaws.com/us-east-1_HDpjACtVG"
  }
}

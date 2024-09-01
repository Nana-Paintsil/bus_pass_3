import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties:
      AdditionalProperties(pubName: 'buspass_api', pubAuthor: 'Nana Paintsil'),
  inputSpecFile:
      'http://localhost:5161/swagger/v1/swagger.json', // Updated Swagger link
  generatorName: Generator.dart, // Corrected generatorName to 'dart'
  outputDirectory:
      'C:/Users/user/Documents/flutter_projects/bus_pass_3', // Corrected the outputDirectory path
)
class Example extends OpenapiGeneratorConfig {}

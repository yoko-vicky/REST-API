class ApplicationController < ActionController::API
  # Setup of json api errors handler gem which will automatically catch every errors that may happen
  # and return 404 as response
  include JsonapiErrorsHandler
  ErrorMapper.map_errors!({
                            'ActiveRecord::RecordNotFound' => 'JsonapiErrorsHandler::Errors::NotFound'
                          })
  rescue_from ::StandardError, with: ->(e) { handle_error(e) }
end

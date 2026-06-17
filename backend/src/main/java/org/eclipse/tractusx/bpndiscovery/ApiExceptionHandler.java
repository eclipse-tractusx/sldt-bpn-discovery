/********************************************************************************
 * Copyright (c) 2023 Robert Bosch Manufacturing Solutions GmbH
 * Copyright (c) 2023 Contributors to the Eclipse Foundation
 *
 * See the NOTICE file(s) distributed with this work for additional
 * information regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Apache License, Version 2.0 which is available at
 * https://www.apache.org/licenses/LICENSE-2.0.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 ********************************************************************************/
package org.eclipse.tractusx.bpndiscovery;

import org.eclipse.tractusx.bpndiscovery.model.Error;
import org.eclipse.tractusx.bpndiscovery.model.ErrorResponse;
import org.eclipse.tractusx.bpndiscovery.service.exception.EntityNotFoundException;
import org.eclipse.tractusx.bpndiscovery.service.exception.ValidationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@ControllerAdvice
public class ApiExceptionHandler extends ResponseEntityExceptionHandler {

   private static final Logger log = LoggerFactory.getLogger( ApiExceptionHandler.class );

   @ExceptionHandler( { ValidationException.class } )
   public ResponseEntity<ErrorResponse> handleValidationException( final HttpServletRequest request,
         final ValidationException exception ) {
      log.debug( "Validation failed for request [{}]: {} | Details: {}", request.getRequestURI(), exception.getMessage(), exception.getDetails() );
      return new ResponseEntity<>( new ErrorResponse()
            .error( new Error()
                  .message( exception.getMessage() )
                  .details( exception.getDetails() )
                  .path( request.getRequestURI() ) ), HttpStatus.BAD_REQUEST );
   }

   @ExceptionHandler( { EntityNotFoundException.class } )
   public ResponseEntity<ErrorResponse> handleEntityNotFoundException( final HttpServletRequest request,
         final RuntimeException exception ) {
      log.debug( "Entity not found for request [{}]: {}", request.getRequestURI(), exception.getMessage() );
      return new ResponseEntity<>( new ErrorResponse()
            .error( new Error()
                  .message( exception.getMessage() )
                  .path( request.getRequestURI() ) ), HttpStatus.NOT_FOUND );
   }

   @ExceptionHandler( { DuplicateKeyException.class } )
   public ResponseEntity<ErrorResponse> handleDuplicateKeyException( final HttpServletRequest request, DuplicateKeyException exception ) {
      log.debug( "Duplicate key violation for request [{}]: {}", request.getRequestURI(), exception.getMostSpecificCause().getMessage() );
      return new ResponseEntity<>( new ErrorResponse()
            .error( new Error()
                  .message( "Entity already exists." )
                  .path( request.getRequestURI() ) ), HttpStatus.OK );
   }

   @ExceptionHandler( { AccessDeniedException.class } )
   public ResponseEntity<ErrorResponse> handleAccessDeniedException( final HttpServletRequest request,
         final AccessDeniedException exception ) {
      log.debug( "Access denied for request [{}]: {}", request.getRequestURI(), exception.getMessage() );
      return new ResponseEntity<>( new ErrorResponse()
            .error( new Error()
                  .message( exception.getMessage() )
                  .path( request.getRequestURI() ) ), HttpStatus.BAD_REQUEST );
   }
}

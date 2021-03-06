# Load the java libraries and import the classes into JBLAS.

# Copyright (c) 2009-2010, Mikio L. Braun and contributors
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#
#     * Neither the name of the Technische Universität Berlin nor the
#       names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior
#       written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require 'java'
begin
  require 'jblas/jblas-1.1.1.jar'
rescue LoadError => e
  begin
    org.jblas.DoubleMatrix
  rescue NameError => e
    raise LoadError, 'Cannot load jblas-1.1.jar, and it also does not seem to be in the class path!'
  end
end

module JBLAS
  ######################################################################
  #
  # Java Classes Import
  #
  ######################################################################

  # In connection with rish (http://mikiobraun.github.com/rish/), we
  # need this guard for possible reloading of this file.
  unless JBLAS < Java
    include Java

    java_import org.jblas.DoubleMatrix
    java_import org.jblas.FloatMatrix
    java_import org.jblas.ComplexDoubleMatrix
    java_import org.jblas.ComplexFloatMatrix
    java_import org.jblas.ComplexDouble
    java_import org.jblas.ComplexFloat
    java_import org.jblas.SimpleBlas
    java_import org.jblas.DoubleFunction
    java_import org.jblas.FloatFunction

    java_import org.jblas.Solve
    java_import org.jblas.Eigen
    java_import org.jblas.Geometry
    java_import org.jblas.Decompose
    java_import org.jblas.MatrixFunctions
    java_import org.jblas.Singular
  end
end

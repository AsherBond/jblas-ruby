# Mixin for making matrices behave like enumerables. Defines JBLAS::MatrixEnumMixin.

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

module JBLAS
  # Mixin for collecting enumerable operations.
  #
  # Collected in MatrixMixin.
  module MatrixEnumMixin
    include Enumerable
    
    # Iterate over rows. 
    def each_row
      (0...rows).each do |i|
        yield row(i)
      end
    end

    # Iterate over columns.
    def each_column
      (0...columns).each do |j|
        yield column(j)
      end
    end

    # Each iterates over each element, going down rows first.
    def each
      (0...length).each do |i|
        yield get(i)
      end
    end

    # Map each element.
    #
    # Returns a new matrix of the same type. This means that the block
    # must return something which can again be stored in the matrix.
    def map(&block)
      return dup.map!(&block)
    end

    # Map each element and store the result in the matrix.
    #
    # Note that the result must be again something
    # which can be stored in the matrix. Otherwise you should do an
    # to_a first.
    def map!(&block)
      (0...length).each do |i|
        put(i, block.call(get(i)))
      end
      self
    end
  end
end
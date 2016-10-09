import React from 'react'
import normalOrderCount from '../lib/normalOrderCount'

export default ({scalarSet}) => (
  <div>And the count is: {normalOrderCount(scalarSet)}</div>
)
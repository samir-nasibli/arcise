#pragma once

#include "mlir/IR/TypeSupport.h"
#include "mlir/IR/Types.h"

namespace arcise::dialects::arrow {
namespace detail {
class ArrayTypeStorage;
class ColumnTypeStorage;
} // namespace detail

struct ArrayType : public mlir::Type::TypeBase<ArrayType, mlir::Type,
                                               detail::ArrayTypeStorage> {
  using Base::Base;
  using ImplType = detail::ArrayTypeStorage;

  static ArrayType get(mlir::MLIRContext *ctx, Type elementType, size_t length);

  mlir::Type getElementType() const;
  size_t getLength() const;
};

struct ColumnType : public mlir::Type::TypeBase<ColumnType, mlir::Type,
                                                detail::ColumnTypeStorage> {
  using Base::Base;
  using ImplType = detail::ColumnTypeStorage;

  static ColumnType get(mlir::MLIRContext *ctx, mlir::Type elementType,
                        mlir::ArrayRef<ArrayType> chunks);

  mlir::Type getElementType() const;
  mlir::ArrayRef<ArrayType> getChunks() const;
};
} // namespace arcise::dialects::arrow
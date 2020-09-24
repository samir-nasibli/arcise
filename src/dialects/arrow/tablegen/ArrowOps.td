#ifndef TABLEGEN_ARROW_OPS
#define TABLEGEN_ARROW_OPS

include "ArrowDialect.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

def AnyNumericType : AnyTypeOf<[I8, I16, I32, I64, F32, F64]>;


class Arrow_ConstOp<string mnemonic, list<OpTrait> traits = []> : Arrow_Op<mnemonic, traits> {
    let verifier = [{ return verifySameArrayParamAndConstType(*this); }];
}

class Arrow_SameArrayOp<string mnemonic, list<OpTrait> traits = []> : Arrow_Op<mnemonic, traits> {
    let verifier = [{ return verifyParamTypesAreSame(*this); }];
} 

// ==== COMPARISON FUNCTIONS ====
// TODO: add trait to check if arr and rhsue types are same
def Arrow_ConstEqOp : Arrow_ConstOp<"const_eq", [NoSideEffect]> {
    let summary = [{ 
        a[i] == const
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, AnyNumericType:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

def Arrow_ConstGeOp : Arrow_ConstOp<"const_ge", [NoSideEffect]> {
    let summary = [{ 
        a[i] >= const
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, AnyNumericType:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

def Arrow_ConstLeOp : Arrow_ConstOp<"const_le", [NoSideEffect]> {
    let summary = [{ 
        a[i] <= const
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, AnyNumericType:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

def Arrow_ConstGtOp : Arrow_ConstOp<"const_gt", [NoSideEffect]> {
    let summary = [{ 
        a[i] > const
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, AnyNumericType:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

def Arrow_ConstLtOp : Arrow_ConstOp<"const_lt", [NoSideEffect]> {
    let summary = [{ 
        a[i] < const
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, AnyNumericType:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

def Arrow_EqOp : Arrow_SameArrayOp<"eq", [NoSideEffect]> {
    let summary = [{ 
        a[i] == b[i]
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, Arrow_AnyChunkedArrayType:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

def Arrow_GeOp : Arrow_SameArrayOp<"ge", [NoSideEffect]> {
    let summary = [{ 
        a[i] >= b[i]
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, Arrow_AnyChunkedArrayType:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

def Arrow_LeOp : Arrow_SameArrayOp<"le", [NoSideEffect]> {
    let summary = [{ 
        a[i] <= b[i]
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, Arrow_AnyChunkedArrayType:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

def Arrow_GtOp : Arrow_SameArrayOp<"gt", [NoSideEffect]> {
    let summary = [{ 
        a[i] > b[i]
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, Arrow_AnyChunkedArrayType:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

def Arrow_LtOp : Arrow_SameArrayOp<"lt", [NoSideEffect]> {
    let summary = [{ 
        a[i] < b[i]
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, Arrow_AnyChunkedArrayType:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

// ==== ARITHMETIC FUNCTIONS ====
def Arrow_ConstSumOp : Arrow_ConstOp<"const_sum", [NoSideEffect]> {
    let summary = [{
        a[i] + const
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, AnyNumericType:$rhs);
    let results = (outs Arrow_AnyChunkedArrayType:$res);
}

def Arrow_ConstSubOp : Arrow_ConstOp<"const_sub", [NoSideEffect]> {
    let summary = [{
        a[i] - const
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, AnyNumericType:$rhs);
    let results = (outs Arrow_AnyChunkedArrayType:$res);
}

def Arrow_ConstDivOp : Arrow_ConstOp<"const_div", [NoSideEffect]> {
    let summary = [{
        a[i] / const
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, AnyNumericType:$rhs);
    let results = (outs Arrow_AnyChunkedArrayType:$res);
}

def Arrow_ConstMulOp : Arrow_ConstOp<"const_mul", [NoSideEffect]> {
    let summary = [{
        a[i] * const
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, AnyNumericType:$rhs);
    let results = (outs Arrow_AnyChunkedArrayType:$res);
}

def Arrow_SumOp : Arrow_SameArrayOp<"sum", [NoSideEffect]> {
    let summary = [{
        a[i] + b[i]
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, Arrow_AnyChunkedArrayType:$rhs);
    let results = (outs Arrow_AnyChunkedArrayType:$res);
}

def Arrow_SubOp : Arrow_SameArrayOp<"sub", [NoSideEffect]> {
    let summary = [{
        a[i] - b[i]
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, Arrow_AnyChunkedArrayType:$rhs);
    let results = (outs Arrow_AnyChunkedArrayType:$res);
}

def Arrow_DivOp : Arrow_SameArrayOp<"div", [NoSideEffect]> {
    let summary = [{
        a[i] / b[i]
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, Arrow_AnyChunkedArrayType:$rhs);
    let results = (outs Arrow_AnyChunkedArrayType:$res);
}

def Arrow_MulOp : Arrow_SameArrayOp<"mul", [NoSideEffect]> {
    let summary = [{
        a[i] * b[i]
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$lhs, Arrow_AnyChunkedArrayType:$rhs);
    let results = (outs Arrow_AnyChunkedArrayType:$res);
}

// ==== BOOLEAN FUNCTIONS ==== 

def Arrow_And : Arrow_Op<"and", [NoSideEffect]> {
    let summary = [{
        a[i] && b[i]
    }];
    let arguments = (ins Arrow_ChunkedArrayType<I1>:$lhs, Arrow_ChunkedArrayType<I1>:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

def Arrow_Or : Arrow_Op<"or", [NoSideEffect]> {
    let summary = [{
        a[i] || b[i]
    }];
    let arguments = (ins Arrow_ChunkedArrayType<I1>:$lhs, Arrow_ChunkedArrayType<I1>:$rhs);
    let results = (outs Arrow_ChunkedArrayType<I1>:$res);
}

// ==== QUERY OPERATIONS ====

def Arrow_Filter : Arrow_Op<"filter", [NoSideEffect]> {
    let summary = [{
        returns only rows that have 1 in bitmap
    }];
    let arguments = (ins Arrow_AnyChunkedArrayType:$arr, Arrow_ChunkedArrayType<I1>:$bitmap);
    let results = (outs Arrow_AnyChunkedArrayType:$res);
}

#endif // TABLEGEN_ARROW_OPS
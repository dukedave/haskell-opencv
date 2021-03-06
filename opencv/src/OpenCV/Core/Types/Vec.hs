{-# language ConstraintKinds #-}
{-# language MultiParamTypeClasses #-}
{-# language TemplateHaskell #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

module OpenCV.Core.Types.Vec
    ( Vec
    , VecDim
    , IsVec(..)

    , Vec2i, Vec2f, Vec2d
    , Vec3i, Vec3f, Vec3d
    , Vec4i, Vec4f, Vec4d
    ) where

import "base" Data.Int ( Int32 )
import "base" Foreign.C.Types
import qualified "inline-c"     Language.C.Inline as C
import qualified "inline-c-cpp" Language.C.Inline.Cpp as C ( using )
import "this" OpenCV.Internal.C.Inline ( openCvCtx )
import "this" OpenCV.Internal.C.Types
import "this" OpenCV.Internal.Core.Types.Vec
import "this" OpenCV.Internal.Core.Types.Vec.TH

--------------------------------------------------------------------------------

C.context openCvCtx
C.include "opencv2/core.hpp"
C.using "namespace cv"

mkVecType "Vec2i" 2 ''Int32   ''C'Vec2i  "int32_t"
mkVecType "Vec2f" 2 ''CFloat  ''C'Vec2f  "float"
mkVecType "Vec2d" 2 ''CDouble ''C'Vec2d  "double"

mkVecType "Vec3i" 3 ''Int32   ''C'Vec3i  "int32_t"
mkVecType "Vec3f" 3 ''CFloat  ''C'Vec3f  "float"
mkVecType "Vec3d" 3 ''CDouble ''C'Vec3d  "double"

mkVecType "Vec4i" 4 ''Int32   ''C'Vec4i  "int32_t"
mkVecType "Vec4f" 4 ''CFloat  ''C'Vec4f  "float"
mkVecType "Vec4d" 4 ''CDouble ''C'Vec4d  "double"

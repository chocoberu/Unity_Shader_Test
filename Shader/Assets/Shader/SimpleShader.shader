// 셰이더 이름
Shader "Unlit/SimpleShader"
{
    // Inspector에서 노출시킬 parameter
    Properties
    {
        _Color("Base Color", Color) = (1,1,1,1) // RGBA
    }
    // 실제 동작하는 셰이더 코드
    // 다양한 플랫폼에서 동작할 수 있도록 여러 SubShader를 가짐
    SubShader
    {
        // 게임 오브젝트가 한 번 그려지는 과정
        Pass
        {
            // 실제 HLSL 작성 부분
            CGPROGRAM
            #include "UnityCG.cginc"

            #pragma vertex vert // VS
            #pragma fragment frag // PS

            fixed4 _Color;
            
            struct vertexInput 
            {
                float3 posL : POSITION;
            };

            struct fragmentInput
            {
                float4 posC : SV_POSITION;
            };

            fragmentInput vert(vertexInput input)
            {
                float4 posC = UnityObjectToClipPos(input.posL); 
                fragmentInput output;
                output.posC = posC;

                return output;
            }

            fixed4 frag(fragmentInput input) : SV_TARGET
            {
                //fixed4 output;
                return _Color;
            }

            ENDCG
        }
    }
}

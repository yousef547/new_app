<?php

namespace App\Http\Controllers;

use App\Models\role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:users,email',
            'username' => 'required|string|min:5|max:30',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return $this->returnError($validator->errors());
        }
        $role = role::where('role_title', 'user')->first();
        $arr = [
            'name' => $request->get('username'),
            'email' => $request->get('email'),
            'password' => Hash::make($request->get('password')),
            'roleid' => $role->id,
            'rolename' => 'user',
        ];
        $user = User::create($arr);
        $token = JWTAuth::fromUser($user);
        return response()->json(compact('user', 'token'), 201);
        return response()->json($arr);
    }



    public function registerAdmin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:users,email',
            'username' => 'required|string|min:5|max:30',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return $this->returnError($validator->errors());
        }
        $role = role::where('role_title', 'admin')->first();
        $arr = [
            'name' => $request->get('username'),
            'email' => $request->get('email'),
            'password' => Hash::make($request->get('password')),
            'roleid' => $role->id,
            'rolename' => 'admin',
        ];
        $user = User::create($arr);
        $token = JWTAuth::fromUser($user);
        return response()->json(compact('user', 'token'), 201);
        return response()->json($arr);
    }


    public function registerDriver(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:users,email',
            'username' => 'required|string|min:5|max:30',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            return $this->returnError($validator->errors());
        }
        $role = role::where('role_title', 'admin')->first();
        $arr = [
            'name' => $request->get('username'),
            'email' => $request->get('email'),
            'password' => Hash::make($request->get('password')),
            'roleid' => $role->id,
            'rolename' => 'driver',
        ];
        $user = User::create($arr);
        $token = JWTAuth::fromUser($user);
        return response()->json(compact('user', 'token'), 201);
        return response()->json($arr);
    }


    public function login(Request $request){

        $username = $request->get('email');
        $password = $request->get('password');
        $user_mes = User::where('email','=',$username)->first();
        if (!$user_mes || !Hash::check($password, $user_mes->password)) {
           return "اسم المستخدم أو كلمة المرور غير صحيحة";
        }
        $token=JWTAuth::fromUser($user_mes);// إنشاء رمز مميز
        if (!$token) {
            return "فشل تسجيل الدخول. يرجى المحاولة مرة أخرى";
        }
        return response()->json(['token'=>$token,'info' => $user_mes]);
        
    }

    public function home(){
        $user=JWTAuth::parseToken()->touser();
        return $user;

    }

    //أوقع
    public function logout(){
        JWTAuth::parseToken()->invalidate();
        return "logout";
    }
}

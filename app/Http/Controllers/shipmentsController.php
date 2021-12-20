<?php

namespace App\Http\Controllers;

use App\Models\shipment;
use App\Traits\GeneralTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class shipmentsController extends Controller
{
    use GeneralTrait;

    public function setShipments(Request $request){
        $validator = Validator::make($request->all(), [
            'from_city' => 'required|exists:cities,id',
            'to_city' => 'required|exists:cities,id',
            'photo' => ['required', 'image', 'mimes:jpeg,jpg,png,gif'],
            'price_prod' => 'required|numeric',
            'price_Shipping' => 'required|numeric',
            'received_date' => 'required|sometimes',
        ]);
        $path = Storage::putFile('shipping', $request->file('photo'));
        $arr = [
            "userId" => Auth::user()->id,
            "from_city" => $request->from_city,
            "to_city" => $request->to_city,
            "photo" => $path,
            "price_prod" => $request->price_prod,
            "price_Shipping" => $request->price_Shipping,
            "received_date" => $request->received_date,
        ];
        $myshipment=shipment::create($arr);
        $myshipment->save();

        return $this->returnData('info', $myshipment, "succsess");
    }
    public function getShipments() {
        $allShipment = shipment::where("userId",Auth::user()->id)->get();
        if( count($allShipment)==0 ) {
            return $this->returnError('there is not Shipments');
        }else {
            return $this->returnData('allShipment', $allShipment, "succsess");
        }
    }
    public function getAllShipments() {
        return $this->returnData('allShipment', shipment::get(), "succsess");

    }
}

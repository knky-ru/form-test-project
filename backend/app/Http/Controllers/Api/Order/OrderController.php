<?php

namespace App\Http\Controllers\Api\Order;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{

    protected $model = Order::class;

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        // API GET http://localhost:8000/api/orders?page[number]=4&page[size]=5
        $ordersList = $this->model::jsonPaginate();
        return response()->json($ordersList, 200);
    }

    /**
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function patch(Request $request, $id)
    {
        $validator = $this->validator($request);
        if ($validator->fails()) {
            return response()->json(["message" => $validator->errors()->all()], 400);
        }

        $order = $this->model::findOrFail($id);
        if ($request->has("name"))
            $order->name = $request->name;
        if ($request->has("status"))
            $order->status = $request->status;
        $order->save();

        return response()->json(["order" => $order], 200);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request)
    {
        $data = $request->only('orders');
        $orders = $data['orders'];
        //$orders = json_decode($data['orders'], true);

        foreach ($orders as $item) {
            $requestOrder = new Request($item);

            $validator = $this->validator($requestOrder);
            if ($validator->fails()) {
                return response()->json([ "message" => $validator->errors()->all(), "order" => $item ], 400);
            }
        }

        $result = [];
        foreach ($orders as $item) {
            $order = $this->model::find($item["id"]);
            if ($order != null) {
                if (array_key_exists("name", $item))
                    $order->name = $item["name"];
                if (array_key_exists("status", $item))
                    $order->status = $item["status"];
                $order->save();
                $result[] = $order;
            }
        }

        return response()->json(["orders" => $result], 200);
    }


    /**
     * @param Request $request
     * @return \Illuminate\Contracts\Validation\Validator
     */
    private function validator(Request $request) {
        $statusesKeysString = implode (",", array_keys(Order::STATUSES));

        $rules = [];
        if ($request->has("name"))
            $rules = array_merge([ "name" => 'required|string|min:3|max:100' ], $rules);
        if ($request->has("status"))
            $rules = array_merge([ "status" => 'required|string|in:'.$statusesKeysString ], $rules);

        $validator = Validator::make($request->all(), $rules);

        return $validator;
    }

}

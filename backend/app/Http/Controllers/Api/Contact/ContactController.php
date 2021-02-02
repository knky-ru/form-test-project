<?php

namespace App\Http\Controllers\Api\Contact;

use App\Http\Controllers\Controller;
use App\Models\Communication;
use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ContactController extends Controller
{

    protected $model = Contact::class;

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        $user = auth()->user();
        $contacts = $this->model::with('type')->where('user_id', $user->id)->get();
        return response()->json([ 'contacts' => $contacts ], 200);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request)
    {
        $user = auth()->user();
        $data = $request->only('contacts');
        $contacts = $data['contacts'];
        // $contacts = json_decode($data['contacts'], true);

        Contact::where('user_id', $user->id)->delete();

        $updatedContacts = [];
        foreach ($contacts as $item) {
            $type = Communication::where('id', $item["type"]["id"])->first();

            $contact = new Contact();
            $contact->order = $item['order'];
            $contact->value = $item['value'];
            $contact->com_type_id = $type->id;
            $contact->user_id = $user->id;
            $contact->setRelation('type', $type);
            $contact->save();
            $contact->refresh();

            $updatedContacts[] = $contact;
        }

        return response()->json(["contacts" => $updatedContacts], 200);
    }

}

<?php

namespace Database\Seeders;

use App\Models\Contact;
use Illuminate\Database\Seeder;

class ContactTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $contacts = [
            [
                'id' => 1,
                'order' => 1,
                'value' => '+79072718868',
                'com_type_id' => 1,
                'user_id' => 1,
            ],
            [
                'id' => 2,
                'order' => 2,
                'value' => '2718868@mail.ru',
                'com_type_id' => 2,
                'user_id' => 1,
            ],
            [
                'id' => 3,
                'order' => 3,
                'value' => 'Звонить с 10 до 18',
                'com_type_id' => 4,
                'user_id' => 1,
            ],
            [
                'id' => 4,
                'order' => 1,
                'value' => 'wrong@mail.ru',
                'com_type_id' => 2,
                'user_id' => 2,
            ],
            [
                'id' => 5,
                'order' => 2,
                'value' => 'https://www.wrong.link/',
                'com_type_id' => 3,
                'user_id' => 2,
            ],
        ];

        foreach ($contacts as $item) {
            echo "Contact ".$item['id']."\n";
            if(!Contact::all()->find($item['id'])){
                echo "Create new Contact ".$item['id']."\n.";
                $contact = new Contact();
                $contact->id = $item['id'];
                $contact->order = $item['order'];
                $contact->value = $item['value'];
                $contact->com_type_id = $item['com_type_id'];
                $contact->user_id = $item['user_id'];
                $contact->save();
            }
        }


    }
}

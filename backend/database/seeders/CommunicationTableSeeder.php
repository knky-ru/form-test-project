<?php

namespace Database\Seeders;

use App\Models\Communication;
use Illuminate\Database\Seeder;

class CommunicationTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $types = [
            [
                'id' => 1,
                'name' => 'Телефон',
                'type' => 'tel',
                'validator' => 'min:11',
            ],
            [
                'id' => 2,
                'name' => 'Е-мейл',
                'type' => 'email',
                'validator' => 'email',
            ],
            [
                'id' => 3,
                'name' => 'Ссылка',
                'type' => 'url',
                'validator' => 'min:3',
            ],
            [
                'id' => 4,
                'name' => 'Комментарий',
                'type' => 'text',
                'validator' => null,
            ],
        ];

        foreach ($types as $item) {
            echo "Comm type ".$item['id']."\n";
            if(!Communication::all()->find($item['id'])){
                echo "Create new Communication ".$item['id']."\n.";
                $commType = new Communication();
                $commType->id = $item['id'];
                $commType->name = $item['name'];
                $commType->type = $item['type'];
                $commType->validator = $item['validator'];
                $commType->save();
            }
        }

    }
}
